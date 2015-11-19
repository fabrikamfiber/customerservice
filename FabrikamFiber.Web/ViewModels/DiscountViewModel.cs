namespace FabrikamFiber.Web.ViewModels
{
	public class DiscountViewModel
	{
		public void DetermineCustomerDiscount(
			int			annualMaintenanceContract,	// the AMC amount
			int			numberOfSeats,				// how many licences?
			Contract	TypeContract,				// customer contract category
			int			accountTenure,				// duration of our relationship with the customer
			out int		BaseDiscount,				// base discount component
			out int		VolumeDiscount)				// volume discount component
		{
			/*
				annualMaintenanceContract   |        <=3000         |              >3000         |
				numberOfSeats               |    <35    |    >=35   |    <35         |    >=35   |
				accountTenure               |     -     |  <5 | >=5 | <5  |    >=5   |  <5 | >=5 |
				Premium                     |  Y  |  N  |  -  |  -  |  -  |  Y  | N  |     |     |
				BaseDiscount  135           |     |     |     |     |  x  |  x  | x  |  x  |  x  |
				BaseDiscount   80           |  x  |  x  |  x  |  x  |     |     |    |     |     |
				VolumeDiscount 15           |  x  |     |  x  |     |     |     |    |     |     |
				VolumeDiscount 20           |     |     |     |     |     |     | x  |     |  x  |
				VolumeDiscount 25           |     |     |     |  x  |     |  x  |    |     |     |
				VolumeDiscount 30           |     |     |     |     |  x  |     |    |  x  |     |
			 */

			// no pre-condition checks .....

			BaseDiscount = 0;
			VolumeDiscount = 0;

			if (annualMaintenanceContract <= 3000)
			{
				if (numberOfSeats < 35)
				{
					if (TypeContract == Contract.Premium)
					{
						BaseDiscount = 80;
						VolumeDiscount = 15;
					}
					else
					{
						BaseDiscount = 80;
						VolumeDiscount = 0;
					}
				}
				else
				{
					if (accountTenure < 5)
					{
						BaseDiscount = 80;
						VolumeDiscount = 15;
					}
					else
					{
						BaseDiscount = 80;
						VolumeDiscount = 25;
					}
				}
			}
			else
			{
				if (numberOfSeats < 35)
				{
					if (accountTenure < 5)
					{
						BaseDiscount = 135;
						VolumeDiscount = 30;
					}
					else
					{
						if (TypeContract == Contract.Premium)
						{
							BaseDiscount = 135;
							VolumeDiscount = 25;
						}
						else
						{
							BaseDiscount = 135;
							VolumeDiscount = 20;
						}
					}
				}
				else
				{
					if (accountTenure < 5)
					{
						BaseDiscount = 135;
						VolumeDiscount = 30;
					}
					else
					{
						BaseDiscount = 135;
						VolumeDiscount = 20;
					}
				}
			}
		}
	}


	public enum Contract
	{
		Premium = 0,
		Regular = 1
	}
}
