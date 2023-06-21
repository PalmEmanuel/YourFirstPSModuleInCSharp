using System;
namespace PEURandom;
class Person
{
    public Person(string name, DateTime birthDate)
    {
        Name = name;
        BirthDate = birthDate;
    }
    public string Name { get; set; }
    public DateTime BirthDate { get; set; }
}