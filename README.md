## Fc - New-Programming-Language-Flex-Bison

The aim of this project is to build a new programming language, called FC (Functional C), using Flex and Bison Tools.
The main idea is to create a lexer(flex (.l file)) and grammar(bison (.y file)) analyzer that will convert FC language to C.
Flex is a lexical analyzer, which ensures that the input code comprised of valid vocabulary, identifiers, escape characters and etc.
On the other hand, Bison is used to design the grammar rules of the language. By merging the aforementioned tools,a new programming language is developed.
Get informed about the specs of the FC by reading the documentation into the 'Documentation' directory.
Inside The code directory there are some examples of the FC language (primenumbers, fibonacci, etch).

# Run the examples by following the steps:
1. Go to Folder 'Code'
2. Compile every input file (FC code), with the simple command line ( make <tag_from_the_MakeFile>)

```
make helloworld
make primenumbers
make fibonacci 
```
****************************************
Author: Logothetis Fragkoulis 
Electrical and Computer Engineer
