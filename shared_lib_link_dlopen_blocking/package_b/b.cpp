#include "a.hpp"
#include "b.hpp"

int sum_b(int a , int b)
{
    return 2*sum_b(a, b);
}
