##
## EPITECH PROJECT, 2021
## makefile
## File description:
## makefile
##

SRC	=	src/strlen.asm \
		src/strcmp.asm \
		src/strchr.asm \
		src/memcpy.asm \
		src/memset.asm \
		src/memmove.asm \
		src/rindex.asm \
		src/strncmp.asm \
		src/strcspn.asm \
		src/strcasecmp.asm \
		src/strstr.asm \
		src/strpbrk.asm

OBJ	=	$(SRC:.asm=.o)

NAME =	libasm.so

%.o: %.asm
		nasm -o $@ $< -f elf64

all:	$(NAME)

$(NAME):	$(OBJ)
	ld -shared -fPIC -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all
