abstract class ISettingsRepository {
  Future<bool> deleteCompanyAccount(int id);
  Future<bool> deleteInfluserAccount(int id);
  Future<bool> deleteUserAccount(int id);
}
