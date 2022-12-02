# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ael-malt <ael-malt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/29 17:18:11 by ael-malt          #+#    #+#              #
#    Updated: 2022/12/02 00:06:09 by ael-malt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libftprintf.a

LIBFT		= ./libft

SRCS		= ft_printf.c

UTILS_PATH	= utils/
UTILS		= $(addprefix $(UTILS_PATH), ft_putchar_len.c ft_putstr_len.c \
					ft_putptr_len.c ft_putnbr_len.c ft_putunbr_len.c \
					ft_puthex_len.c)

SURPL_O		= ft_putchar_len.o ft_putnbr_len.o ft_putstr_len.o  ft_putptr_len.o \
				ft_putunbr_len.o ft_puthex_len.o

CC = gcc

FLAGS = -c -Wall -Wextra -Werror

INCLUDES = -I./includes

OBJS = $(SRCS:.c=.o) $(UTILS:.c=.o)

$(NAME): $(OBJS)
	$(MAKE) bonus -C ./libft
	cp libft/libft.a $(NAME)
	$(CC) $(FLAGS) $(INCLUDES) $(SRCS) $(UTILS)
	ar -rcs $(NAME) $(OBJS)

all : $(NAME)

clean :
	$(MAKE) clean -C ./libft
	rm -rf $(OBJS) $(SURPL_O)

fclean : clean
	$(MAKE) fclean -C ./libft
	rm -rf $(NAME)

re : fclean all