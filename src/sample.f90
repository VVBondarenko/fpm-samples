module sample
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, sample!"
  end subroutine say_hello
end module sample
