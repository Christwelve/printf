# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 07:53:40 by cmeng             #+#    #+#              #
#    Updated: 2022/11/17 19:41:45 by cmeng            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= 	libftprintf.a
CFLAGS		= 	-Wall -Werror -Wextra -I incl
CC			= 	cc
SRC_FILES	= 	src/ft_printf.c \
				src/printf_tools.c \
				libft/itoa.c \
OBJECTS		= 	$(FILES:.c=.o)
# LIBFT		= 	libft
# INCLUDES	= 	incl

# .c files beinhaltet die programmierte Logik, .o die compilierte (in Maschinensprache) übersetzt und
# zusammengeführt als Libary in der libftprintf.a

# RULES

%.o: %.c								#sucht passende .c file und compiliert .o file
	$(CC) -c $(CFLAGS) -o $@ $ˆ

$(NAME): $(OBJECTS)						#erstellt archiv (libary) aus allen .o files (wird in libftprinft.a gespeichert)
	ar -crs $(NAME) $ˆ

test: $(OBJECTS) src/main.o				#.o file wird ausgeführt und test gestartet
	$(CC) $(CFLAGS) $^ && ./a.out

clean:									#remove .o files
	rm -f $(OBJECTS)

fclean: clean							#remove libary
	rm -f $(NAME)

re: fclean all							#remove .o files and libary

all: $(NAME)

.PHONY:  test clean fclean re libft/libft.a all


# %.o: %.c
# 	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# $(NAME): $(OBJECTS) $(INCLUDES)
# 	ar -crs $(NAME) $ˆ

# all: $(NAME)

# clean:
# 	rm -f src/*.o

# fclean: clean
# 	rm -f $(NAME)
# re:
# 	fclean all

# lib/libft.a:
# 	@$(MAKE) -C $(LIBFT)

# .PHONY: all bonus test clean fclean



