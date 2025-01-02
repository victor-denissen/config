#this shit is shit
#source ~/.gef-5927df4fb307124c444453b1cb85fa0ce79883c9.py

set detach-on-fork off
set history save on
set history size 10000
set history filename ~/.gdb_history

# set logging enabled on
set	logging file .gdb.txt


define test
	printf "----------------------------------------"
end
 
define par
    set $arr = $arg0
    set $iter = 0
    while $arr[$iter] != 0x0
        print $arr[$iter]
        set $iter = $iter + 1
    end
end
document par
print array
arg0 = array;
end

define ps
	print (char *)$arg0
end
document ps
print c++ string cuz gdb cant by default here
end

define plist
	set $list = $arg0
	while $list
		print *$list
		set $list = $list->next
	end
end
document plist
print linked list
linked list needs *next node
end

define lsof
  shell rm -f pidfile
  set logging file pidfile
  set logging on
  info proc
  set logging off
  shell lsof -p `cat pidfile | perl -n -e 'print $1 if /process (.+)/'`
end

document lsof
  List open files
end
 
define follow
    set follow-fork-mode $arg0
end
document follow
set follow-fork-mode $arg0
end
 
define fi
    info locals
    info args
end
document fi
info frame
print the local and argument variables of current frame
end
 
define f
    finish
end
document f
finnish current function
end
 
define btf
    bt -full
end
document btf
gives the current backtrace with all variables in each function call
end
 
define bi
    info breakpoints
end
document bi
info breakpoints
end
 
define rel
    source .gdbinit
end
document rel
reload local .gdbinit file
end
 
define re
    source ~/.gdbinit
end
document re
reload ~/.gdbinit file
end

#source ~/peda/peda.py
#define hook-stop
#session autosave
#end
