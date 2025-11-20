#!/usr/bin/env python3
import sys

def fizz_buzz(limit):
    for i in range(1, limit + 1):
        output = ''
        if i % 3 == 0:
            output += 'fizz'
        if i % 5 == 0:
            output += 'buzz'

        if output:
            print(output)
        else:
            print(i)
        

def main():
    fizz_buzz(int(sys.argv[1]))

if __name__ == '__main__':
    main()
