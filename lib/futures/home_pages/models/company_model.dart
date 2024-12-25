class CompanyModel {
  final String title, companyName, productCount;

  CompanyModel({
    required this.productCount,
    required this.title,
    required this.companyName,
  });
}

List<CompanyModel> companyList = [
  CompanyModel(
    productCount: '1005',
    title: 'KPMS',
    companyName: 'Kai Project Management Services Ltd.',
  ),
  CompanyModel(
    productCount: '100',
    title: 'Tools',
    companyName: 'Kai International.',
  ),
  CompanyModel(
    productCount: '005',
    title: 'BMI',
    companyName: 'BIR METAL ENGINEERING & MANUFACTURING CO. LTD.',
  ),
  CompanyModel(
    productCount: '055',
    title: 'Vikars',
    companyName: 'Vikars Hardware',
  ),
  CompanyModel(
    productCount: '055',
    title: 'BCEL',
    companyName: 'Bir Consumers Engineering Ltd.',
  ),
];
