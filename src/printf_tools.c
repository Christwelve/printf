/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   printf_tools.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/15 10:30:06 by cmeng             #+#    #+#             */
/*   Updated: 2022/11/28 11:57:55 by cmeng            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../incl/ft_printf.h"

int	ft_putchar(char c)
{
	return (write(1, &c, 1));
}

int	ft_putstr(char *s)
{
	int	len;

	len = 0;
	if (s == NULL)
		return (0);
	while (*s != '\0')
	{
		len += write(1, s, 1);
		s++;
	}
	return (len);
}

int	ft_putnbr(int n)
{
	int	len;

	len = 0;
	if (n == -2147483648)
	{
		len = ft_putstr("-2147483648");
	}
	else
	{
		if (n < 0)
		{
			len += ft_putchar('-');
			n = n * -1;
		}
		if (n > 9)
		{
			len += ft_putnbr(n / 10);
		}
		len += ft_putchar((n % 10) + '0');
	}
	return (len);
}
