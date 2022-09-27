simple CPU stress tests that require no additional packages installation
wanted to see at what point CPU stops to scale if I add another thread
example:

$ ./bomb.sh 32 do_the_work_sha.sh
or
$ ./bomb.sh 32 do_the_work_count.sh
