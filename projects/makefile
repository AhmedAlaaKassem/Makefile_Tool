
vpath %.c ./src
vpath %.o ./dependancies
vpath %.h ./inc
cc = gcc_S  
object_files = code.o main.o DIO.o LCD.o
include_path = ./inc 
dependancies_path = ./dependancies
link_target = app.exe
clean_target = $(dependancies_path)/*.o $(link_target)

all : $(link_target)

$(link_target) : $(object_files)
	$(cc) $(dependancies_path)/*.o -o $@                               
	
%.o : %.c
	$(cc) -c -I$(include_path) $< -o $(dependancies_path)/$@
	
clean :
	del $(clean_target)

compile :
	make_S $(object_files)
	
