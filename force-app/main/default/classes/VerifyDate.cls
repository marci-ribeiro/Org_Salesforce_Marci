public class VerifyDate {
	
	//método para lidar com possíveis verificações em duas datas
	public static Date CheckDates(Date date1, Date date2) {
		//se data2 estiver dentro dos próximos 30 dias de data1, use data2. Caso contrário, use o final do mês
		if(DateWithin30Days(date1,date2)) {
			return date2;
		} else {
			return SetEndOfMonthDate(date1);
		}
	}
	
	//método para verificar se data2 está dentro dos próximos 30 dias de data1
	private static Boolean DateWithin30Days(Date date1, Date date2) {
		//verifique se a data2 está no passado
        	if( date2 < date1) { return false; }
        
        	//verifique se a data2 está dentro de (> =) 30 dias da data1
        	Date date30Days = date1.addDays(30); //crie uma data a 30 dias de distância da data1
		if( date2 >= date30Days ) { return false; }
		else { return true; }
	}

	//método para retornar o final do mês de uma determinada data
	private static Date SetEndOfMonthDate(Date date1) {
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
		return lastDay;
	}
}