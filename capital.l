/*LAB 1
Group 4:
Omondi Trevor Antony	136243
Sally Keju	129197
Ethan Kanja	136444
Cynthia Musila	134653
Mary Aladwa	129097
Abraham Kanyi	136614
Kirui Allan Kiprono	120406*/

/* Definition Section */
%{
int word_count = 0; /* variable word count is definied and initiallized to 0 */
%}

/* Rule Section

There are 3 rules. 
First rule- matches one or more consecutive alphabetic characters (both lowercase and uppercase)
Second rule- is a single period (.) that matches any character except a newline character (\n). However, there is no associated action with this rule, so it effectively discards these characters.
Third rule- It detects the presence of a newline character (`\n`). When such a character is found, it carries out the linked action, which involves displaying the overall count of words calculated (stored in `word_count`) in the provided input and returning 0 to signify the conclusion of input processing.

*/

%%
[a-zA-Z]+ {
    printf("%s\n", yytext);
    word_count++;
}
. {
    // Skip characters that are not part of words
}
\n {
    printf("\nNumber of words in the given input: %d\n", word_count);
    return 0;  
}
%%

/* Code Section */
int yywrap() {
    return 1;  // Indicates the end of input processing
}

int main() {
    // Removes the comment marks from the lines below in order to enable input from a file.
    /*
    FILE *fp;
    char filename[50];
    printf("Enter the filename: \n");
    scanf("%s", filename);
    fp = fopen(filename, "r");
    yyin = fp;
    */

    yylex();
    return 0;
}