/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/21 18:56:36 by cmeng             #+#    #+#             */
/*   Updated: 2022/11/29 14:53:36 by cmeng            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdio.h>
#include <stdlib.h>

static int	ft_amount_characters(int n)
{
	int	i;

	i = 0;
	if (n < 0)
		i++;
	if (n == 0)
		i++;
	while (n)
	{
		n = n / 10;
		i++;
	}
	return (i);
}

char	*ft_itoa(int n)
{
	char	*output;
	int		size;
	int		negative;

	if (n == -2147483648)
		return (ft_strdup("-2147483648"));
	size = ft_amount_characters(n);
	output = ft_calloc((size + 1), sizeof(char));
	if (!output)
		return (NULL);
	negative = 0;
	if (n < 0)
	{
		n *= (-1);
		output[0] = '-';
		size -= 1;
		negative = 1;
	}
	while (size)
	{
		output[(size - 1) + negative] = n % 10 + '0';
		size--;
		n = n / 10;
	}
	return (output);
}
