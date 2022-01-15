program check
    ! use testdrive, only : new_unittest, unittest_type, error_type, check
    use json_module
implicit none

type(json_file) :: json
logical :: found
integer :: i,j,k

! initialize the class
call json%initialize()

! read the file
call json%json_file_load_from_string(str = '{"version":{"major":2,"minor":2, &
& "patch":1,"string":"2.2.1","svn":7191},"data":[{"number":1,"tf1":true,"tf2":false, &
& "empty":null,"name":"Horatio","array":["1","2","3"]},{"number":2,"integer":33, &
& "real":233.3,"name":"Nelson"}],"rfc6901 tests":{"foo":["bar","baz"], &
& "  ":0,"a/b":1,"c%d":2,"e^f":3,"g|h":4,"i\\j":5,"k\"l":6," ":7,"m~n":8}}')

! print the file to the console
call json%print()

! extract data from the file
! [found can be used to check if the data was really there]
call json%get('version.major', i, found)
if ( .not. found ) stop 1
call json%get('version.minor', j, found)
if ( .not. found ) stop 1
call json%get('data(1).number', k, found)
if ( .not. found ) stop 1

! clean up
call json%destroy()
if (json%failed()) stop 1


print *, "Put some tests in here!"
! call check(error, 1 + 2 == 3)

end program check
