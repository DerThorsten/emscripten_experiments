#include "a.hpp"
#include "b.hpp"

namespace b
{
    int sum(int a , int b)
    {
        return a::sum(a, b);
    }
}