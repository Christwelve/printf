/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   printf_tools.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/15 10:30:06 by cmeng             #+#    #+#             */
/*   Updated: 2022/11/21 09:48:02 by cmeng            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../incl/ft_printf.h"

int	ft_putchar(char c)
{
	return (write(1, &c, 1));
}

int	ft_putstr(char *s)
{
	int	res;

	res = 0;
	if (s == NULL)
		return (0);
	while (*s != '\0')
	{
		res += write(1, s, 1);
		s++;
	}
	return (res);
}

int	ft_putnbr(int n)
{
	int	res;

	res = 0;
	if (n == -2147483648)
	{
		res = ft_putstr("-2147483648");
	}
	else
	{
		if (n < 0)
		{
			res += ft_putchar('-');
			n = n * -1;
		}
		if (n > 9)
		{
			res += ft_putnbr(n / 10);
		}
		res += ft_putchar((n % 10) + '0');
	}
	return (res);
}
