import time
from tkinter.ttk import *
from tkinter import *
import tkinter as tk
import datetime
import serial       # 导入模块
import serial.tools.list_ports
import threading
from tkinter import messagebox
from ttkbootstrap import Style
from PIL import Image, ImageTk

global UART                                         # 全局型式保存串口句柄
global RX_THREAD                                    # 全局型式保存串口接收函数
global gui                                          # 全局型式保存GUI句柄

tx_cnt = 0                                          # 发送字符数统计
rx_cnt = 0                                          # 接收字符数统计

def ISHEX(data):                                    # 判断输入字符串是否为十六进制
    if len(data) % 2:
        return False
    for item in data:
        if item not in '0123456789ABCDEFabcdef':    # 循环判断数字和字符
            return False
    return True

def uart_open_close(fun, com, bund):                # 串口打开关闭控制
    global UART
    global RX_THREAD

    if fun == 1:  # 打开串口
        try:
            UART = serial.Serial(com, bund, timeout=0.2)        # 提取串口号和波特率并打开串口
            if UART.isOpen():  # 判断是否打开成功
                lock = threading.Lock()
                RX_THREAD = UART_RX_TREAD('URX1', lock)   # 开启数据接收进程
                RX_THREAD.setDaemon(True)                       # 开启守护进程 主进程结束后接收进程也关闭 会报警告 不知道咋回事
                RX_THREAD.start()
                RX_THREAD.resume()
                return True
        except:
            return False
        return False
    else:  # 关闭串口
        print("关闭串口")
        RX_THREAD.pause()
        UART.close()        

def uart_tx(data, isHex=False):
    global UART
    try:
        if UART.isOpen():
            # 发送前判断串口状态 避免错误
            data_with_header_footer = "00" + data + "ff00"
            print("uart_send=" + data_with_header_footer)
            gui.tx_rx_cnt(tx=len(data_with_header_footer))  # 发送计数
            if isHex:
                # 十六进制发送
                data_bytes = bytes.fromhex(data_with_header_footer)
                for byte in data_bytes:
                    UART.write(byte.to_bytes(1, byteorder='big'))  # Send one byte at a time

    except Exception as e:
        # 错误返回
        print(e)
        messagebox.showinfo('错误', '发送失败')

class UART_RX_TREAD(threading.Thread):          # 数据接收进程
    global gui

    def __init__(self, name, lock):
        threading.Thread.__init__(self)
        self.mName = name
        self.mLock = lock
        self.mEvent = threading.Event()

    def run(self):  # 主函数
        print('开启数据接收\r')
        while True:
            self.mEvent.wait()
            self.mLock.acquire()
            if UART.isOpen():
                rx_buf = UART.read()
                if len(rx_buf) > 0:
                    rx_buf += UART.readall()  # 有延迟但不易出错
                    gui.tx_rx_cnt(rx=len(rx_buf))

                    print('收到hex数据', rx_buf.hex().upper())
                    gui.txt_rx.insert(END, rx_buf.hex().upper())

            self.mLock.release()

    def pause(self):  # 暂停
        self.mEvent.clear()

    def resume(self):  # 恢复
        self.mEvent.set()


# ---------------------------------------------GUI---------------------------------------------- #
class GUI:
    def __init__(self):
        self.root = Tk()
        self.root.title('易灵思串口调试助手')  # 窗口名称
        self.root.geometry("1020x510")  # 尺寸位置
        # 主题修改 可选['cyborg', 'journal', 'darkly', 'flatly' 'solar', 'minty', 'litera', 'united', 'pulse', 'cosmo', 'lumen', 'yeti', 'superhero','sandstone']
        Style(theme='pulse')  
        self.interface()

    def interface(self):
        """界面编写位置"""
        # -------------------------------- LEFT IMAGE ------------------------------- #
        # self.fr0 = Frame(self.root)
        # self.fr0.place(x=0, y=0, width=153, height=360)

        # path_Left_Image = "./Image/Left_1200x510.png"
        # image_Left_Image = Image.open(path_Left_Image).resize((153, 360), Image.Resampling.LANCZOS)
        # photo_Left_Image = ImageTk.PhotoImage(image_Left_Image)

        # self.Left_Image = Label(self.fr0, image=photo_Left_Image)
        # self.Left_Image.image = photo_Left_Image
        # self.Left_Image.place(x=0, y=0, width=153, height=360)


        # --------------------------------操作区域(frame_1)------------------------------ #
        self.fr1 = Frame(self.root)
        self.fr1.place(x=153, y=0, width=180, height=360)  # 区域1位置尺寸

        self.lb1 = Label(self.fr1, text='端口号：', font="微软雅黑", fg='red')  # 点击可刷新
        self.lb1.place(x=0, y=5, width=100, height=35)

        self.var_cb1 = StringVar()
        self.comb1 = Combobox(self.fr1, textvariable=self.var_cb1)
        self.comb1['values'] = list(serial.tools.list_ports.comports())  # 列出可用串口
        # self.comb1.current(0)  # 设置默认选项 0开始
        self.comb1.place(x=10, y=40, width=150, height=30)
        com = list(serial.tools.list_ports.comports())

        print('**********可用串口***********')
        for i in range(0, len(com)):
            print(com[i])
        print('***************************')

        self.lb2 = Label(self.fr1, text='波特率：')
        self.comb2 = Combobox(self.fr1, values=['9600','19200','57600','115200','512000'], state='readonly')
        self.comb2.current(3)  # 设置默认选项 115200
        self.lb2.place(x=5, y=85, width=60, height=20)
        self.comb2.place(x=10, y=110, width=100, height=25)

        self.var_bt1 = StringVar()
        self.var_bt1.set("打开串口")
        self.btn1 = Button(self.fr1, textvariable=self.var_bt1, command=self.uart_opn_close)  # 绑定 uart_opn_close 方法
        self.btn1.place(x=10, y=150, width=150, height=30)

        self.var_cs1 = IntVar()  # 定义返回类型
        self.rd1 = Radiobutton(self.fr1, text="邻近域", variable=self.var_cs1, value=1)   # 选择后清除显示内容
        self.rd2 = Radiobutton(self.fr1, text="双线性插值", variable=self.var_cs1, value=0)
        self.rd1.place(x=95, y=190, width=60, height=30)
        self.rd2.place(x=10, y=190, width=80, height=30)

        self.var_cs2 = IntVar(value=0)  # 定义返回类型
        self.rd3 = Radiobutton(self.fr1, text="放大模式", variable=self.var_cs2, value=0, command=self.toggle_move)
        self.rd4 = Radiobutton(self.fr1, text="缩小模式", variable=self.var_cs2, value=1, command=self.toggle_move) 
        self.rd3.place(x=5, y=220, width=80, height=30)
        self.rd4.place(x=90, y=220, width=80, height=30)

        self.btn3 = Button(self.fr1, text='清空', command=self.txt_clr)  # 绑定清空方法
        self.btn3.place(x=10, y=260, width=60, height=30)
        self.is_movement_allowed = True  # 初始时允许移动
        self.btn3 = Button(self.fr1, text='锁定', command=self.toggle_movement)   # 绑定锁定方法
        self.btn3.place(x=95, y=260, width=60, height=30)
        self.btn4 = Button(self.fr1, text='保存', command=self.savefiles)  # 绑定保存方法
        self.btn4.place(x=10, y=310, width=60, height=30)
        self.btn6 = Button(self.fr1, text='发送', command=lambda: [self.uart_send()])
        self.btn6.place(x=95, y=310, width=60, height=30)

        # -------------------------------参数区域(frame_2)------------------------------- #
        self.fr2 = Frame(self.root)  # 区域2 容器  relief   groove=凹  ridge=凸
        self.fr2.place(x=320, y=0, width=490, height=360)  # 区域2位置尺寸

        self.length_label = Label(self.fr2, text="长度", anchor='w')
        self.length_label.place(x=10, y=0+10, width=80, height=30)
        self.length = Text(self.fr2, state=tk.NORMAL)
        self.length.insert(tk.END, "960")
        self.length.place(x=430, y=0+10, width=60, height=30)
        self.length.bind("<KeyRelease>", self.update_scale_from_text)
        self.length_scale = tk.Scale(self.fr2, from_=1, to=1920, orient=tk.HORIZONTAL,variable=IntVar(value=960),
                                      command=lambda value:self.update_text_from_scale(value,self.length))
        self.length_scale.place(x=60, y=8+10, width=350, height=15)

        self.width_label = Label(self.fr2, text="宽度", anchor='w')
        self.width_label.place(x=10, y=30+10, width=80, height=30)
        self.width = Text(self.fr2, state=tk.NORMAL)
        self.width.insert(tk.END, "540")
        self.width.place(x=430, y=30+10, width=60, height=30)
        self.width.bind("<KeyRelease>", self.update_scale_from_text)
        self.width_scale = tk.Scale(self.fr2, from_=1, to=1080, orient=tk.HORIZONTAL, variable=IntVar(value=540),
                                      command=lambda value: self.update_text_from_scale(value, self.width))
        self.width_scale.place(x=60, y=38+10, width=350, height=15)

        # ------------------------------------画布--------------------------------------- #         
        
        self.canvas = Canvas(self.root, height=271, width=481)
        self.canvas.config(state=tk.NORMAL, bg='silver')
        self.canvas.place(x=329, y=74)
        self.clickID = -1

        # 在画布上画一个矩形
        self.rectangle = self.canvas.create_rectangle(120, 67.5, 360, 202.5, fill='#CCFFFF', activefill='red')

        self.canvas.bind("<ButtonPress-1>", self.StartMove)
        self.canvas.bind("<ButtonRelease-1>", self.StopMove)
        self.canvas.bind("<B1-Motion>", self.OnMotion)

        # -------------------------------返回信息区域(frame_3)------------------------------- #
        self.fr3 = Frame(self.root)  # 区域3 容器  relief   groove=凹  ridge=凸
        self.fr3.place(x=155, y=355, width=660, height=200)  # 区域3位置尺寸

        self.txt_rx = Text(self.fr3)
        self.txt_rx.place(x=7, y=0, width=648, height=120)  # 比例计算控件尺寸和位置

        # 收发字符监控
        self.lb3 = Label(self.fr3, text='接收:0    发送:0', bg="yellow", anchor='w')
        self.lb3.place(x=5, y=125, width=100, height=20)

        # 时钟实现
        self.lb4 = Label(self.fr3, text=' ', anchor='w', relief=GROOVE)
        self.lb4.place(x=556, y=125, width=100, height=20)

        # 标签用于显示矩形框的坐标
        self.coord_label = Label(self.fr3, text='(480, 270, 1440, 810)')
        self.coord_label.place(x=250, y=125)

        # --------------------------- IMAGE RIGHT(frame_4) --------------------------- #
        # self.fr4 = Frame(self.root)  # 区域4 容器  relief   groove=凹  ridge=凸
        # self.fr4.place(x=540+120+180, y=0, width=180, height=360)  # 区域1位置尺寸

        # path_Right_Image = "./Image/Right_1200x600.png"
        # image_Right_Image = Image.open(path_Right_Image).resize((180, 360), Image.Resampling.LANCZOS)
        # photo_Right_Image = ImageTk.PhotoImage(image_Right_Image)

        # self.Right_Image = Label(self.fr4, image=photo_Right_Image)
        # self.Right_Image.image = photo_Right_Image
        # self.Right_Image.place(x=0, y=0, width=180, height=360)



    # -----------------------------------方法---------------------------------- #
    def update_text_from_scale(self, value, text_widget):
        text_widget.delete("1.0", tk.END)
        text_widget.insert(tk.END, value)
        if text_widget == self.length:
            self.update_rectangle_width(self.length.get("1.0", tk.END).strip())
        if text_widget == self.width:
            self.update_rectangle_height(self.width.get("1.0", tk.END).strip())

    def update_scale_from_text(self, event=None):
        # Get the widget that is currently focused
        focused_widget = self.fr2.focus_get()
        # Check which text widget is focused and update the corresponding scale widget
        if focused_widget == self.length:
            try:
                value = int(self.length.get("1.0", tk.END).strip())
                self.length_scale.set(value)
            except ValueError:
                pass  # Optionally handle invalid input here
        if focused_widget == self.width:
            try:
                value = int(self.width.get("1.0", tk.END).strip())
                self.width_scale.set(value)
            except ValueError:
                pass  # Optionally handle invalid input here

    def fetch_and_combine(self):
        # Fetching values from the Text widgets
        var_cs=self.var_cs1.get()
        up_down = self.var_cs2.get()

        length_val = int(self.length.get("1.0", "end-1c"))
        width_val = int(self.width.get("1.0", "end-1c"))

        coords=self.canvas.coords(self.rectangle)
        start_x = max(int(coords[0]*4),0)
        start_y = max(int(coords[1]*4),0)
        end_x = min(int(coords[2]*4),1920)
        end_y = min(int(coords[3]*4),1080)
                
        # 数据格式转化
        start_x = hex(start_x)[2:]
        start_x = start_x.zfill(4)
        start_y = hex(start_y)[2:]
        start_y = start_y.zfill(4)

        end_x = hex(end_x)[2:]
        end_x = end_x.zfill(4)
        end_y = hex(end_y)[2:]
        end_y = end_y.zfill(4)

        length_val = hex(length_val)[2:]
        length_val = length_val.zfill(4)
        width_val = hex(width_val)[2:]
        width_val = width_val.zfill(4)
        
        # Combining the fetched values
        if (up_down == 0):
            combined_string = f"{0}{up_down}{start_x}{start_y}{end_x}{end_y}{0}{var_cs}"
        else:
            combined_string = f"{0}{up_down}{length_val}{width_val}{0}{var_cs}"
        return combined_string

    def gettim(self):  # 获取时间 未用
        timestr = time.strftime("%H:%M:%S")  # 获取当前的时间并转化为字符串
        self.lb4.configure(text=timestr)  # 重新设置标签文本
        self.txt_rx.after(1000, self.gettim)  # 每隔1s调用函数 gettime 自身获取时间 GUI自带的定时函数

    def txt_clr(self):  # 清空显示
        self.txt_rx.delete(0.0, 'end')      # 清空文本框
        if self.var_cs2.get():
            self.length.delete("1.0", tk.END)
            self.length.insert(tk.END, 960)
            self.width.delete("1.0", tk.END)
            self.width.insert(tk.END, 540)
            self.length_scale.set(960)
            self.width_scale.set(540)
        else:
            self.canvas.coords(self.rectangle, 120, 67.5, 360, 202.5)
            self.length.delete("1.0", tk.END)
            self.length.insert(tk.END, 960)
            self.width.delete("1.0", tk.END)
            self.width.insert(tk.END, 540)
            self.length_scale.set(960)
            self.width_scale.set(540)

    def uart_opn_close(self):               # 打开关闭串口
        if (self.var_bt1.get() == '打开串口'):
            if (uart_open_close(1, str(self.comb1.get())[0:5],
                                self.comb2.get()) == True):  # 传递下拉框选择的参数 COM号+波特率  【0:5】表示只提取COM号字符
                self.var_bt1.set('关闭串口')  # 改变按键内容
                self.btn1.config(bg='red')
                self.txt_rx.insert(0.0, self.comb1.get() + ' 打开成功\r\n')  # 开头插入
            else:
                print("串口打开失败")
                messagebox.showinfo('错误', '串口打开失败')
        else:
            uart_open_close(0, 'COM1', 115200)  # 关闭时参数无效
            self.var_bt1.set('打开串口')
            self.btn1.config(bg='#593196')

    def uart_send(self):  # 发送数据
        send_data = self.fetch_and_combine()
        if (ISHEX(send_data) == False):
            messagebox.showinfo('错误', '请输入十六进制数')
            return
        uart_tx(send_data, True)

    def tx_rx_cnt(self, rx=0, tx=0):  # 发送接收统计
        global tx_cnt, rx_cnt
        rx_cnt += rx
        tx_cnt += tx
        self.lb3['text'] = '接收：' + str(rx_cnt), '发送：' + str(tx_cnt)

    def savefiles(self):  # 保存日志TXT文本
        try:
            with open('log.txt', 'a') as file:  # a方式打开 文本追加模式
                file.write(self.txt_rx.get(0.0, 'end'))
                messagebox.showinfo('提示', '保存成功')
        except:
            messagebox.showinfo('错误', '保存日志文件失败！')
    
    def toggle_move(self):
        if self.var_cs2.get():
            self.btn3.config(state=tk.DISABLED,bg='grey')
            self.reset_rectangle_position()
            self.update_coord_label()
            self.canvas.config(state=tk.DISABLED)
            self.canvas.unbind("<ButtonPress-1>")
            self.canvas.unbind("<ButtonRelease-1>")
            self.canvas.unbind("<B1-Motion>")
        else:
            self.btn3.config(state=tk.NORMAL,bg='#593196')
            self.canvas.config(state=tk.NORMAL)
            self.canvas.bind("<ButtonPress-1>", self.StartMove)
            self.canvas.bind("<ButtonRelease-1>", self.StopMove)
            self.canvas.bind("<B1-Motion>", self.OnMotion)

    def toggle_movement(self):
        self.is_movement_allowed = not self.is_movement_allowed
        if self.is_movement_allowed:
            self.btn3.config(bg='#593196')
            self.canvas.config(state=tk.NORMAL)
        else:
            self.btn3.config(bg='grey')
            self.canvas.config(state=tk.DISABLED)

    def StartMove(self, event):
        global first_x, first_y, clickID
        allID = self.canvas.find_closest(event.x, event.y)
        if self.is_movement_allowed and len(allID) > 0:
            self.clickID = allID[0]
            first_x, first_y = event.x, event.y

    def StopMove(self, event):
        global first_x, first_y, clickID
        if self.is_movement_allowed and self.clickID != -1:
            self.canvas.move(self.clickID, event.x - first_x, event.y - first_y)
            self.clickID = -1
            self.update_coord_label()

    def OnMotion(self, event):
        global first_x, first_y, clickID
        if self.is_movement_allowed and self.clickID != -1:
            self.canvas.move(self.clickID, event.x - first_x, event.y - first_y)
            first_x, first_y = event.x, event.y
            self.update_coord_label()

    def reset_rectangle_position(self):
        # Set the position to (0, 0)
        width = int(self.width.get("1.0", tk.END).strip()) / 4
        length = int(self.length.get("1.0", tk.END).strip()) / 4
        self.canvas.coords(self.rectangle, 0, 0, length, width)
        
    def update_coord_label(self):
        # 获取矩形框的当前坐标
        coords = self.canvas.coords(self.rectangle)
        # 更新标签文本
        self.coord_label.config(text=f'({max(int(coords[0]*4),0)}, {max(int(coords[1]*4),0)}, {min(int(coords[2]*4),1920)}, {min(int(coords[3]*4),1080)})')

    def update_rectangle_width(self, value):
        # 获取滑动条的值，并更新矩形的宽度
        width = int(value) / 4
        x1, y1, x2, y2 = self.canvas.coords(self.rectangle)
        self.canvas.coords(self.rectangle, x1, y1, x1 + width, y2)
        self.update_coord_label()

    def update_rectangle_height(self, value):
        # 获取滑动条的值，并更新矩形的高度
        height = int(value) / 4
        x1, y1, x2, y2 = self.canvas.coords(self.rectangle)
        self.canvas.coords(self.rectangle, x1, y1, x2, y1 + height)
        self.update_coord_label()

if __name__ == '__main__':
    print('Star...')
    gui = GUI()
    gui.gettim()  # 开启时钟
    gui.root.mainloop()
    UART.close()  # 结束关闭 避免下次打开错误
    print('End...')
