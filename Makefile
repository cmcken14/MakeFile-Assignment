#/**
#* @file Makefile
#* @author Christian McKenzie
#* @date 2025-02-17
#* @brief Makefile for the employee files
#*
#* To make a makefile that will run and make the right files and make it cleanly
#*/

#Compiler variable
CC = g++

#Target variable
TARGET = employee

#Compile flags variable
CFLAGS = -c -Wall -Wextra

#Defualt target:
all: $(TARGET)

#Link all .o files and create the binary for $TARGET
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) main.o Employee.o Officer.o Supervisor.o -o $(TARGET)

#Compile main.cpp
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp -o main.o

#Compile Employee.cpp
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp -o Employee.o

#Compiler Officer.cpp
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp -o Officer.o

#Compile Supervisor.cpp
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp -o Supervisor.o

#Clean target
clean:
	rm -f main.o Employee.o Officer.o Supervisor.o $(TARGET) *~