using System;

namespace PEURandom;

public interface IPerson {
    string Name { get; }
    DateTime BirthDate { get; }
}

public record Person(string Name, DateTime BirthDate) : IPerson;
