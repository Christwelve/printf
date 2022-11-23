# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 07:53:40 by cmeng             #+#    #+#              #
#    Updated: 2022/11/23 13:55:48 by cmeng            ###   ########.fr        #
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
AR			=	ar -rcs


#SOURCES

SRC_FILES	=	src/ft_printf.c \
	 			src/printf_tools.c \

OBJ_FILES	=	$(SRC_FILES:.c=.o)


#RULES

# %.o: %.c $(INCLUDE)				#sucht passende .c file und compiliert .o file
# 	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@


# $(NAME): $(OBJ_FILES) 			#erstellt archiv (libary) aus allen .o files (wird in libftprinft.a gespeichert)
# 	@make -C $(LIBFT)
# 	@cp libft/libft.a .
# 	@mv libft.a $(NAME)
# 	@ar -crs $(NAME) $(OBJ_FILES)

# test: $(OBJ_FILES) 				#.o file wird ausgeführt und test gestartet
# 	@make -C $(LIBFT)
# 	@cp libft/libft.a .
# 	@mv libft.a $(NAME)
# 	@$(CC) $(CFLAGS) $(INCLUDE) $(NAME) $(OBJ_FILES)
# clean:							#remove .o files
# 	rm -f $(OBJ_FILES)

# fclean: clean					#remove libary
# 	rm -f $(NAME)

# re: fclean all					#remove .o files and libary - restart

# all: $(NAME)


# .PHONY:  test clean fclean re all libft/libft.a

# MAN_SRC		= 	src/ft_printf.c \
# 				src/printf_tools.c \

# MAN_OBJ		= 	$(MAN_SRC:.c=.o)

# INCLUDES	= 	incl/ft_printf.h

# LIBS		=	libft/libft.a
# LIBFT		= 	libft

# .c files beinhaltet die programmierte Logik, .o die compilierte (in Maschinensprache) übersetzt und
# zusammengeführt als Libary in der libftprintf.a

# RULES

$(NAME): $(OBJ_FILES) 					#erstellt archiv (libary) aus allen .o files (wird in libftprinft.a gespeichert)
	@make -C $(LIBFT)
	@cp libft/libft.a .
	@mv libft.a $(NAME)
	@$(AR) $(NAME) $(OBJ)
	@echo "ft_printf compiled!"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c 					#sucht passende .c file und compiliert .o file
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

test: $(OBJ_FILES) 						#.o file wird ausgeführt und test gestartet
	@make -C $(LIBFT)
	@cp libft/libft.a .
	@mv libft.a $(NAME)
	@$(CC) $(CFLAGS) $(INCLUDE) $(NAME) $(OBJ_FILES)
	@echo "test compiled!"

clean:									#remove .o files
	@$(RM) -rf $(OBJ_DIR)
	@make clean -C $(LIBFT)
	@echo "ft_printf object files cleaned!"

fclean: clean							#remove libary
	@$(RM) -f $(NAME)
	@$(RM) -f $(LIBFT)/libft.a
	@echo "ft_printf executable files cleaned!"
	@echo "libft executable files cleaned!"

re: fclean all							#remove .o files and libary - restart
	@echo "Cleaned and rebuilt everything for ft_printf!"
all: $(NAME)

.PHONY:  test clean fclean re all




# %.o: %.c
# 	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# $(NAME): $(OBJ_FILES) $(INCLUDES)
# 	ar -crs $(NAME)

# all: $(NAME)

# clean:
# 	rm -f $(OBJ_FILES)

# fclean: clean
# 	rm -f $(NAME)
# re:
# 	fclean all

# # lib/libft.a:
# # 	@$(MAKE) -C $(LIBFT)

# .PHONY: all bonus test clean fclean



