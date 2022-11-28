# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 07:53:40 by cmeng             #+#    #+#              #
#    Updated: 2022/11/28 10:32:01 by cmeng            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= 	libftprintf.a
CFLAGS		= 	-Wall -Werror -Wextra
CC			= 	cc
INCLUDE 	=	-I incl
LIBFT		=	libft
SRC_DIR		= 	src/
OBJ_DIR		= 	obj/
RM			=	rm -f
AR			=	ar -crs


#SOURCES

SRC_FILES	=	src/ft_printf.c \
	 			src/printf_tools.c \
				src/printf_hex.c \
				src/main.c \

OBJ_FILES	=	$(SRC_FILES:.c=.o)


# RULES

$(NAME): $(OBJ_FILES) 					#erstellt archiv (libary) aus allen .o files (wird in libftprinft.a gespeichert)
	make --silent -C $(LIBFT)
	cp libft/libft.a .
	mv libft.a $(NAME)
	$(AR) $(NAME) $(OBJ_FILES)
	@echo "*** ft_printf compiled!***"

%.o: %.c 								#sucht passende .c file und compiliert .o file
	$(CC) $(CFLAGS) $(INCLUDE) -c $^ -o $@

test: $(OBJ_FILES) 						#.o file wird ausgeführt und test gestartet
	$(CC) $(CFLAGS) $(INCLUDE) $(NAME) $(OBJ_FILES) && ./a.out 


clean:									#remove .o files
	$(RM) $(OBJ_FILES)
	make clean -C $(LIBFT)
	@echo "*** ft_printf + libft object files cleaned! ***"

fclean: clean							#remove libary
	$(RM) $(NAME)
	$(RM) $(LIBFT)/libft.a
	@echo "*** ft_printf + libft executable (.a) files cleaned! ***"

re: fclean all							#remove .o files and libary - restart
	@echo "*** Cleaned and rebuilt everything for ft_printf! ***"

all: $(NAME)

.PHONY:  test clean fclean re all

