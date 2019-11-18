
##############################      Variables       ###################################
cc               = gcc_S  
Dependencies_dir = Dependencies
include_dir    	 = inc 
objs_dir 	     = objs
src_dir 	     = src
output 		     = app.exe
##############################    Source Files       ###################################  

source_files += $(src_dir)/code.c  $(src_dir)/main.c $(src_dir)/DIO.c $(src_dir)/LCD.c

########################################################################################

##############################    object Files       ###################################

ObjectFiles := $(patsubst $(src_dir)/%,$(objs_dir)/% ,$(source_files:.c=.o))

########################################################################################

###############################    TARGETS       #######################################
clean_target = $(output) $(objs_dir) $(Dependencies_dir)

all : $(output)

clean :
	del $(clean_target) 

compile :
	make_S $(object_files)
########################################################################################

#########################    GENERATING O FILES       ##################################

$(output) : $(ObjectFiles)  
	$(cc) $(objs_dir)/*.o -o $@                               
	
$(objs_dir)/%.o  : $(src_dir)/%.c  
	$(cc) -c -I$(include_dir) $< -o $@

########################################################################################

#########################    GENERATING D FILES       ##################################

$(Dependencies_dir)/%.d : $(src_dir)/%.c 
	$(cc)  -MT'$(objs_dir)/$*.o'  -MM -I$(include_dir) $< -o $@ 
	
-include $(patsubst $(src_dir)/%,$(Dependencies_dir)/% ,$(source_files:.c=.d))

########################################################################################


