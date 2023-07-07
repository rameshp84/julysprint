public class EmpDetails {
	public string empCompName;
    public integer empNumber;
    public string empName;
    public string empDOB;
    public integer empSalary;
    public string empBgroup;
    public string empDOJ;
    public string empQual;
    public string empDesig;
    public string empExp;
    public string empMobile;
    public string empAdd;
    public string empCompAdd;
    public EmpDetails(){
        empCompName = 'Golars Environmental Engineering Pvt Ltd.';
        empNumber = 3032;
        empName = 'Ramesh Pallerla';
		empDOB = '20/08/1993';
		empSalary = 100000;        
        empBgroup = 'A+';
        empDOJ = '18/02/2019';
        empQual = 'B.Tech(EEE)';
    	empDesig = 'Senior Salesforce Developer';
    	empExp = '3.2 Years';
        empMobile = '9701568387';
        empAdd = 'H.No: EWS - 323, Road Number 2, KPHB, Hyderabad - 500078.';
        empCompAdd = 'Falt No:402, Maitrivanam Building, Opp. to Saradi Studios, Hyderbad - 500016.';
    }
    public void empDisplay(){
        system.debug('Employee Company Name - '+empCompName);
        system.debug('Employee Number - '+empNumber);        
        system.debug('Employee Name - '+empName);        
        system.debug('Employee Date of Birth - '+empDOB);        
        system.debug('Employee Salary - '+empSalary);        
        system.debug('Employee Blood Group - '+empBGroup);
        system.debug('Employee Date of Joining - '+empDOJ);
        system.debug('Employee Qualifications - '+empQual);        
        system.debug('Employee Designation - '+empDesig);
        system.debug('Employee Experience - '+empExp);
        system.debug('Employee Contact Number - '+empMobile);
        system.debug('Employee Residential Address - '+empAdd);
        system.debug('Employee Company Address - '+empCompAdd);
    }
}