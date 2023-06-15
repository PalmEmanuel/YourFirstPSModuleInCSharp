using System;

namespace PEURandom;

public interface IPerson {
    string Name { get; }
    DateTime BirthDate { get; }
}

record Person(string Name, DateTime BirthDate) : IPerson;
