/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   printf_hex.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/23 22:08:35 by cmeng             #+#    #+#             */
/*   Updated: 2022/11/28 15:43:09 by cmeng            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../incl/ft_printf.h"

static int	amount_characters(int n)
{
	int	i;

	i = 0;
	if (n < 0)
		i++;
	if (n == 0)
		i++;
	while (n)
	{
		n = n / 16;
		i++;
	}
	return (i);
}

int	ft_hex(int n)
{
	int		temp;
	int		size;
	int		res;
	char	*str;

	size = amount_characters(n);
	res = 0;
	str = ft_calloc((size + 1), sizeof(char));
	if (!str)
		return (0);
	while (size)
	{
		temp = n % 16;
		if (temp < 10)
			temp += '0';
		else
			temp += 'a' - 10;
		str[--size] = temp;
		n = n / 16;

	}
	res += ft_putstr(str);
	return (res);
}

int	ft_hex_upper(int n)
{
	int		temp;
	int		size;
	int		res;
	char	*str;

	size = amount_characters(n);
	res = 0;
	str = ft_calloc((size + 1), sizeof(char));
	if (!str)
		return (0);
	while (size)
	{
		temp = n % 16;
		if (temp < 10)
			temp += '0';
		else
			temp += 'A' - 10;
		str[--size] = temp;
		n = n / 16;

	}
	res += ft_putstr(str);
	return (res);
}