import rclpy
import serial

from rclpy.node import Node

class RtkGps(Node):
    def __init__(self):
        super().__init__('RtkGpsNode')
        self.print_serial()

    def print_serial(self):
        while True:
            readDev = serial.Serial('/dev/ttyACM0')
            line = readDev.readline()
            print(line)
            readDev.close()
        
def main(args=None):
    rclpy.init(args=args)
    node = RtkGps()
    rclpy.spin(node)
    rclpy.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
