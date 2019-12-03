
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define INPUTSIZE  80
#define DEFAULT_NAME "phonebook.txt"

typedef struct ELEM
{
  char        *name;
  char        *phone;
  struct ELEM *next;  
  struct ELEM *prev;
}
elem_t;

typedef struct LIST
{
  elem_t *first;
  elem_t *last;
  int     size;  
}
list_t;

list_t phoneBook = { NULL, NULL, 0};


typedef int (*comfunc_t)();

typedef struct COMMAND
{
  char     *comStr;
  int       nPars;
  comfunc_t comFunc;  
} 
command_t;

int help( char **pars);
int quit( char **pars);
int list( char **pars);
int add( char **pars);
int del( char **pars);
int print( char **pars);
int save( char **pars);
int saveas( char **pars);
int load( char **pars);
int loadfrom( char **pars);

command_t *findCommand( char *buffer);
int findParams( command_t *comPtr, char **pars);

int insert( elem_t *before, char **params);
void erase( elem_t *ptr);

static command_t commands[] = {
  /* command, paraméterei száma, mit csináljon*/
  { "help",  0, help  },
  { "quit",  0, quit  },
  { "list",  0, list  },
  { "add",   2, add   },
  { "del",   1, del   },
  { "print", 1, print }, 
  { "save",  0, save  },
  { "saveas",1, saveas},
  { "load",  0, load  },
  { "loadfrom", 1, loadfrom }  
};

const int nCommands = sizeof(commands)/sizeof(commands[0]);

int main()
{
  char buffer[INPUTSIZE];

  printf("PB> ");
  while ( NULL != fgets( buffer, INPUTSIZE, stdin) )
  {
    command_t *comPtr;	  
    if ( (comPtr = findCommand( buffer)) )	  
    {
      char *pars[2] = { NULL, NULL};	  
      if( findParams( comPtr, pars) )
      {
        comPtr->comFunc(pars); 
      }	
    }    
    printf("PB> ");
  }
  return 0;
}

command_t *findCommand( char *buffer)
{
  int   i; 
  /*
  strtok: "    add gsd"
  -----------------------
  | add      gsd.....   |
  -----------------------
  whitespace karaktereket átugorja
  paraméterek: <buffer címe>, <\t\n>
                              elválasztó karakterek
                              --> ezeket átírja \o-akra
                              TILOS 'xyz' -t adni neki
    begin az első szó kezdet lesz

  */
  char *beg = strtok( buffer, " \t\n");

  if ( NULL == beg )    
     return 0; 

  for ( i = 0; i < nCommands; ++i)
  {
    /*
    strcmp return 0, ha azonosak
    minden más esetben NEM
    */
    if ( 0 == strcmp( commands[i].comStr, beg) )
    {
      return &commands[i];      
    }	    
  }	  
  fprintf( stderr, "Unknown command: %s\n", buffer);
  return 0;
}

int findParams( command_t *comPtr, char **params)
{
  char  *par1, *par2;	
  if ( 0 == comPtr->nPars )
    return 1;	   
  if ( 1 == comPtr->nPars )
  {	  
    if ( NULL == (par1 = strtok( NULL, " \t\n")) )
    {
      fprintf( stderr, "Too few parameters: %s NAME\n", comPtr->comStr);
      return 0;     
    }
    params[0] = par1;
    return 1;
  }
  if ( 2 == comPtr->nPars )
  {     	  
    if ( NULL == (par1 = strtok( NULL, " \t\n")) || 
         NULL == (par2 = strtok( NULL, " \t\n")) )	    
    {
      fprintf( stderr, "Too few parameters: %s NAME PHONE\n", comPtr->comStr);
      return 0;     
    }
    params[0] = par1;
    params[1] = par2;
    return 1;       
  }	   
  return 0;
}

int help(char **params)
{
  int i = 0;
  printf( "Usage: command par1 par2\n  where commands are: ");  
  for ( i = 0; i < nCommands; ++i)
  {
    printf( "%s, ", commands[i].comStr);  
  }	
  printf("\n");
  return 1;
}

int quit(char **params)
{
  exit(0);
}

int list(char **params)
{
  elem_t *ptr = phoneBook.first;
  printf("======= entries =======\n");
  while ( ptr )
  {
    printf( "%s:\t%s\n", ptr->name, ptr->phone);
    ptr = ptr->next;    
  }
  printf("=======================\n");
  return 1;
}

int saveas(char **params)
{
  elem_t *ptr;	
  FILE *fp = fopen( params[0], "w"); 
  if ( NULL == fp )
  {
    fprintf( stderr, "Can open %s for write\n", params[0]);	  
    return 0;
  }
  ptr = phoneBook.first;
  while ( ptr )
  {
    fprintf( fp, "%s%s\n", ptr->name, ptr->phone);
    ptr = ptr->next;    
  }
  fclose(fp);
  return 1;
}

int save(char **params)
{
  params[0] = DEFAULT_NAME;
  return saveas( params); 
}

int load(char **params)
{
  params[0] = DEFAULT_NAME;
  return loadfrom( params);  
}

int loadfrom( char **params)
{
  char buffer[INPUTSIZE];
  FILE *fp = fopen( params[0], "r"); 
  if ( NULL == fp )
  {	  
    fprintf( stderr, "Can open %s for write\n", params[0]);	  
    return 0;
  }
  while ( NULL != fgets( buffer, INPUTSIZE, fp) )
  { 
    char *colon = strtok( buffer, ",");
    if ( NULL == colon )
    {
      fprintf( stderr, "Bad file format: %s\n", buffer);
      return 1;      
    }
    params[0] = buffer;
    params[1] = colon+1;
    add( params);
  }
  return 1;
}

int add(char **params)
{
  elem_t *ptr = phoneBook.first;

  while ( ptr )
  {
    if ( 0 == strcmp( ptr->name, params[0]) )
    {	    
      printf( "add: %s already in phonebook\n", params[0]);
      return 0;
    }
    else if ( 0 > strcmp( ptr->name, params[0]) )
    {	    
      ptr = ptr->next;    
    }
    else 
    {
      return insert( ptr->prev, params); /* insert before */
    }	    
  }
  return insert( phoneBook.last, params); /* insert last */	 
}

int insert( elem_t *before, char **params)
{      	
  elem_t *newPtr = (elem_t*) malloc(sizeof(elem_t));	    
  if ( NULL == newPtr )
  {
    fprintf(stderr, "add: no memory\n");
    return 0;    
  }
  if ( 0 == phoneBook.size )
  {
    newPtr->next = newPtr->prev = NULL;
    phoneBook.first = phoneBook.last = newPtr;    
  }	  
  else 
  {	  
    newPtr->prev = before;
    newPtr->next = before ? before->next : phoneBook.first;           
    if ( newPtr->prev ) newPtr->prev->next = newPtr; 
    else phoneBook.first = newPtr;
    if ( newPtr->next ) newPtr->next->prev = newPtr; 
    else phoneBook.last = newPtr;      
  }
  ++phoneBook.size;  
  newPtr->name  = (char *) malloc( strlen(params[0]+1)); 
  newPtr->phone = (char *) malloc( strlen(params[1]+1)); 
  strcpy( newPtr->name,  params[0]);	  
  strcpy( newPtr->phone, params[1]);
  return 1;
}

void erase( elem_t *ptr)
{
  if ( ptr->prev ) ptr->prev->next = ptr->next;
  if ( ptr->next ) ptr->next->prev = ptr->prev;
  if ( phoneBook.first == ptr ) phoneBook.first = ptr->next;  
  if ( phoneBook.last  == ptr ) phoneBook.last  = ptr->prev;  
  --phoneBook.size;
  free(ptr);
}

int del(char **params)
{
  elem_t *ptr = phoneBook.first;

  while ( ptr )
  {
    if ( 0 == strcmp( ptr->name, params[0]) )
    {	    
      free(ptr->name);
      free(ptr->phone);
      erase(ptr);
      return 1;
    }
    ptr = ptr->next;
  }
  printf("del: %s not found\n", params[0]);
  return 1;
}

int print(char **params)
{
  elem_t *ptr = phoneBook.first;

  while ( ptr )
  {
    if ( 0 == strcmp( ptr->name, params[0]) )
    {	    
      printf( "%s:\t%s\n", ptr->name, ptr->phone);
      return 1;
    }
    ptr = ptr->next;
  }
  printf("print: %s not found\n", params[0]);
  return 0;
}

