/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cmeng <cmeng@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/10 10:11:19 by cmeng             #+#    #+#             */
/*   Updated: 2022/11/16 14:48:26 by cmeng            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	format_specifier(char *format, va_list args);

int	ft_printf(const char *format, ...)
{
	int		res;
	char	*format_cpy;
	va_list	args;

	format_cpy = (char *)format;
	res = 0;
	va_start(args, format);
	while (*format_cpy != '\0')
	{
		if (*format_cpy != '%')
		{
			res += write (1, format_cpy, 1);
			format_cpy++;
		}
		else
		{
			format_cpy++;
			format_specifier(format_cpy, args);
			format_cpy++;
		}
		res += format_specifier(format_cpy, args);
	}
	va_end(args);
	return (res);
}

int	format_specifier(char *format, va_list args)
{
	int	len;

	len = 0;
	if (*format == 'c')
		len += ft_putchar(va_arg(args, int ));
	if (*format == 's')
		len += ft_putstr(va_arg(args, char *));
	if (*format == 'd')
		len += ft_putstr(ft_itoa(va_arg(args, int)));
	if (*format == 'i')
		len += ft_putstr(ft_itoa(va_arg(args, int)));
	if (*format == 'p')
		// len += "ft_ptr"  function to print the pointer adress
	if (*format == 'u')
		len += ft_putstr(va_arg(args, char *));	//itoa base 10 unsigned
	if (*format == 'x')
		len += ft_putstr(va_arg(args, char *));	//itoa base 16 lower x
	if (*format == 'X')
		len += ft_putstr(va_arg(args, char *));	//itoa base 16 upper x
	if (*format == '%')
		len += ft_putchar('%');
	return (len);

}