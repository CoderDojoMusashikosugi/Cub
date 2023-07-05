import rclpy
import serial
import time
import re

from rclpy.node import Node

class RtkGps(Node):
    def __init__(self):
        super().__init__('RtkGpsNode')
        self.print_serial()

    def print_serial(self):
        while True:
            readDev = serial.Serial('/dev/ttyACM0', 230400, timeout=None)
            while True:
                line = readDev.readline()
                if line:
                    for num in range(len(line)):
                        if line[num:num+3] == b'$GP':
                            str = line[num+1:len(line)].decode().replace("\r\n", "")
                            # print(re.split('[,*]', str))
                            break
                        elif line[num:num+3] == b'$GL':
                            str = line[num+1:len(line)].decode().replace("\r\n", "")
                            # print(re.split('[,*]', str))
                            break
                        elif line[num:num+3] == b'$GA':
                            str = line[num+1:len(line)].decode().replace("\r\n", "")
                            # print(re.split('[,*]', str))
                            break
                        elif line[num:num+3] == b'$GB':
                            str = line[num+1:len(line)].decode().replace("\r\n", "")
                            # print(re.split('[,*]', str))
                            break
                        elif line[num:num+3] == b'$GN':
                            str = line[num+1:len(line)].decode().replace("\r\n", "")
                            print(re.split('[,*]', str))
                            break
                else:
                    break
            readDev.close()
            time.sleep(0.1)
        
def main(args=None):
    rclpy.init(args=args)
    node = RtkGps()
    rclpy.spin(node)
    rclpy.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
