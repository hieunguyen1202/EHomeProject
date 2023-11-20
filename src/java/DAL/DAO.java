/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Building;
import Models.City;
import Models.District;
import Models.Facility;
import Models.House;
import Models.HouseType;
import Models.RentEntity;
import Models.RentEntityType;
import Models.Users;
import Models.Ward;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

/**
 *
 * @author Hieu
 */
public class DAO extends DBContext {

    public static DAO INSTANCE = new DAO();
    private List<House> house;
    private HashMap<Integer, Users> userMap;
    private HashMap<Integer, Ward> wardMap;
    private HashMap<Integer, District> districtMap;
    private HashMap<Integer, City> cityMap;
    private HashMap<Integer, HouseType> HouseTypeMap;
    private HashMap<Integer, House> houseMap;
    private HashMap<Integer, Facility> facilityMap;
    private HashMap<Integer, RentEntityType> rentEntityTypeMap;

    public void setUserMap(HashMap<Integer, Users> userMap) {
        this.userMap = userMap;
    }

    public HashMap<Integer, Users> getUserMap() {
        return userMap;
    }

    public void setHouse(List<House> house) {
        this.house = house;
    }

    public List<House> getHouse() {
        return house;
    }

    public HashMap<Integer, House> getHouseMap() {
        return houseMap;
    }

    public void setHouseMap(HashMap<Integer, House> houseMap) {
        this.houseMap = houseMap;
    }

    public HashMap<Integer, Ward> getWardMap() {
        return wardMap;
    }

    public void setWardMap(HashMap<Integer, Ward> wardMap) {
        this.wardMap = wardMap;
    }

    public HashMap<Integer, District> getDistrictMap() {
        return districtMap;
    }

    public void setDistrictMap(HashMap<Integer, District> districtMap) {
        this.districtMap = districtMap;
    }

    public void setCityMap(HashMap<Integer, City> cityMap) {
        this.cityMap = cityMap;
    }

    public HashMap<Integer, City> getCityMap() {
        return cityMap;
    }

    public HashMap<Integer, Facility> getFacilityMap() {
        return facilityMap;
    }

    public void setFacilityMap(HashMap<Integer, Facility> facilityMap) {
        this.facilityMap = facilityMap;
    }

    public HashMap<Integer, HouseType> getHouseTypeMap() {
        return HouseTypeMap;
    }

    public void setHouseTypeMap(HashMap<Integer, HouseType> HouseTypeMap) {
        this.HouseTypeMap = HouseTypeMap;
    }

    public HashMap<Integer, RentEntityType> getRentEntityTypeMap() {
        return rentEntityTypeMap;
    }

    public void setRentEntityTypeMap(HashMap<Integer, RentEntityType> rentEntityTypeMap) {
        this.rentEntityTypeMap = rentEntityTypeMap;
    }

    public int getTotalUsers() {
        int totalUsers = 0;
        String sql = "SELECT COUNT(*) FROM UsersHE171464";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt(1);
            }
            return totalUsers;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalUsers;
    }

    public House getHouseById(int houseId) {
        String sql = "SELECT * FROM [dbo].[HouseHE171464] where [HouseId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                House h = new House(
                        rs.getInt("houseId"),
                        rs.getString("name"),
                        rs.getInt("wardId"),
                        rs.getString("address"),
                        rs.getInt("status"),
                        rs.getString("image"),
                        rs.getInt("houseTypeId"),
                        rs.getString("map"),
                        rs.getInt("buildingId"),
                        rs.getString("ownerId")
                );
                return h;
            }
        } catch (SQLException e) {
            System.out.println("error get house by id: " + e);
        }
        return null;
    }

    public RentEntity getRentEntityById(int rentEntityId) {
        String sql = "SELECT * FROM [dbo].[RentEntityHE171464] where [RentEntityId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rentEntityId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                RentEntity e = new RentEntity(
                        rs.getInt("rentEntityId"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("rentTypeId"),
                        rs.getInt("houseId"),
                        rs.getInt("price"),
                        rs.getInt("area"),
                        rs.getString("image"),
                        rs.getInt("status"),
                        rs.getString("createTime"),
                        rs.getInt("maxPeople"),
                        rs.getString("depositBy"),
                        rs.getString("depositTime"),
                        rs.getString("updateBy")
                );
                return e;
            }
        } catch (SQLException e) {
            System.out.println("error get rent by id: " + e);
        }
        return null;
    }

    public List<RentEntity> getRentEntityDeposit(String username) {
        List<RentEntity> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[RentEntityHE171464] where [depositBy] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new RentEntity(
                        rs.getInt("rentEntityId"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("rentTypeId"),
                        rs.getInt("houseId"),
                        rs.getInt("price"),
                        rs.getInt("area"),
                        rs.getString("image"),
                        rs.getInt("status"),
                        rs.getString("createTime"),
                        rs.getInt("maxPeople"),
                        rs.getString("depositBy"),
                        rs.getString("depositTime"),
                        rs.getString("updateBy")
                ));
            }
        } catch (SQLException e) {
            System.out.println("error get rent by deposit: " + e);
        }
        return list;
    }

    public Building getBuildingById(int buildingId) {
        String sql = "SELECT * FROM [dbo].[BuildingHE171464] where [BuildingId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, buildingId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Building b = new Building(
                        rs.getInt("buildingId"),
                        rs.getString("name"),
                        rs.getInt("wardId"),
                        rs.getString("address"),
                        rs.getString("image"),
                        rs.getString("map"),
                        rs.getInt("status")
                );
                return b;
            }
        } catch (SQLException e) {
            System.out.println("error get building by id: " + e);
        }
        return null;
    }

    public Facility getFacilityById(int facilityId) {
        String sql = "SELECT * FROM [dbo].[FacilityHE171464] where [FacilityId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, facilityId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Facility b = new Facility(
                        rs.getInt("facilityId"),
                        rs.getString("name"),
                        rs.getInt("status"),
                        rs.getString("icon")
                );
                return b;
            }
        } catch (SQLException e) {
            System.out.println("error get Facility by id: " + e);
        }
        return null;
    }

    public Users getUserByUsernameOnly(String username) {
        String sql = "select * from UsersHE171464 where Username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(
                        rs.getString("username"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getBoolean("gender"),
                        rs.getString("dob"),
                        rs.getString("image"),
                        rs.getString("citizenNumber"),
                        rs.getString("citizenNumberDate")
                );
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users checkUsers(String username, String password) {
        String sql = "SELECT \n"
                + "      [Username]\n"
                + "      ,[Password]\n"
                + "      ,[Role]\n"
                + "	  ,[Image]\n"
                + "	  ,[Fullname]\n"
                + "  FROM [dbo].[UsersHE171464]\n"
                + "  where Username = ? and Password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"), rs.getString("Image"), rs.getString("fullname"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Users> getUsers() {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[UsersHE171464]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Users(
                        rs.getString("username"),
                        rs.getString("fullname"),
                        rs.getBoolean("gender"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getInt("role")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Building> getBuildingAll() {
        List<Building> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[BuildingHE171464]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Building(
                        rs.getInt("buildingId"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getInt("status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<RentEntity> getRentEntityByUser(String username) {
        List<RentEntity> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[RentEntityHE171464] where [UpdateBy] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new RentEntity(
                        rs.getInt("rentEntityId"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("rentTypeId"),
                        rs.getInt("houseId"),
                        rs.getInt("price"),
                        rs.getInt("area"),
                        rs.getString("image"),
                        rs.getInt("status"),
                        rs.getString("createTime"),
                        rs.getInt("maxPeople"),
                        rs.getString("depositBy"),
                        rs.getString("depositTime"),
                        rs.getString("updateBy")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<House> getHouseByUser(String username) {
        List<House> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[HouseHE171464] where [OwnerId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new House(
                        rs.getInt("houseId"),
                        rs.getString("name"),
                        rs.getInt("wardId"),
                        rs.getString("address"),
                        rs.getInt("status"),
                        rs.getString("image"),
                        rs.getInt("houseTypeId"),
                        rs.getString("map"),
                        rs.getInt("buildingId"),
                        rs.getString("ownerId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<RentEntity> getRentEntityNotNullDeposit(String username) {
        List<RentEntity> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[RentEntityHE171464]\n"
                + "WHERE [UpdateBy] = ? AND [DepositBy] IS NOT NULL AND [status] != 4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new RentEntity(
                        rs.getInt("rentEntityId"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("rentTypeId"),
                        rs.getInt("houseId"),
                        rs.getInt("price"),
                        rs.getInt("area"),
                        rs.getString("image"),
                        rs.getInt("status"),
                        rs.getString("createTime"),
                        rs.getInt("maxPeople"),
                        rs.getString("depositBy"),
                        rs.getString("depositTime"),
                        rs.getString("updateBy")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<House> loadHouse() {
        List<House> houseList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[HouseHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                houseList.add(new House(
                        rs.getInt("houseId"),
                        rs.getString("name"),
                        rs.getInt("wardId"),
                        rs.getString("address"),
                        rs.getInt("status"),
                        rs.getString("image"),
                        rs.getInt("houseTypeId"),
                        rs.getString("map"),
                        rs.getInt("buildingId"),
                        rs.getString("ownerId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return houseList;
    }

    public List<RentEntityType> loadRentEntityTypes() {
        List<RentEntityType> RentEntityTypeList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[RentEntityTypeHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RentEntityTypeList.add(new RentEntityType(
                        rs.getInt("rentTypeId"),
                        rs.getString("name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return RentEntityTypeList;
    }

    public List<Facility> loadFacilityList() {
        List<Facility> facilityList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[FacilityHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                facilityList.add(new Facility(
                        rs.getInt("facilityId"),
                        rs.getString("name"),
                        rs.getInt("status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    public List<RentEntity> loadRentEntityList(Integer rentTypeId) {
        List<RentEntity> rentEntityList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[RentEntityHE171464]";

        // Check if a specific RentEntityId
        if (rentTypeId != null) {
            sql += " WHERE RentTypeId = ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            if (rentTypeId != null) {
                ps.setInt(1, rentTypeId);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                if (rs.getString("depositBy") != null && rentTypeId != null || (rs.getString("depositBy") != null && rentTypeId == null)) {
                    // Skip displaying items to home
                } else {
                    // Display items to home
                    rentEntityList.add(new RentEntity(
                            rs.getInt("rentEntityId"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getInt("rentTypeId"),
                            rs.getInt("houseId"),
                            rs.getInt("price"),
                            rs.getInt("area"),
                            rs.getString("image"),
                            rs.getInt("status"),
                            rs.getString("createTime"),
                            rs.getInt("maxPeople"),
                            rs.getString("depositBy"),
                            rs.getString("depositTime"),
                            rs.getString("updateBy")));
                }
            }
        } catch (SQLException e) {
            System.out.println("error load rent: " + e.getMessage());
        }
        return rentEntityList;
    }

    public List<RentEntity> loadRentEntityTop5List() {
        List<RentEntity> rentEntityList = new ArrayList<>();
        String sql = "SELECT TOP 5 *\n"
                + "FROM RentEntityHE171464\n"
                + "ORDER BY RentEntityId DESC;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                rentEntityList.add(new RentEntity(
                        rs.getInt("rentEntityId"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("rentTypeId"),
                        rs.getInt("houseId"),
                        rs.getInt("price"),
                        rs.getInt("area"),
                        rs.getString("image"),
                        rs.getInt("status"),
                        rs.getString("createTime"),
                        rs.getInt("maxPeople"),
                        rs.getString("depositBy"),
                        rs.getString("depositTime"),
                        rs.getString("updateBy")
                ));
            }
        } catch (SQLException e) {
            System.out.println("error load rent: " + e.getMessage());
        }
        return rentEntityList;
    }

    public Map<Integer, Building> loadBuilding() {
        Map<Integer, Building> createMap = new HashMap<>();
        String sql = "SELECT BuildingId, Name FROM [dbo].[BuildingHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int buildingId = rs.getInt("buildingId");
                String fullName = rs.getString("name");
                createMap.put(buildingId, new Building(buildingId, fullName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<String, Users> loadCreateBy() {
        Map<String, Users> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[UsersHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String fullName = rs.getString("fullname");
                String image = rs.getString("image");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                createMap.put(username, new Users(username, fullName, image, email, phone));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<Integer, Ward> loadWard() {
        Map<Integer, Ward> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[WardHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int wardId = rs.getInt("wardId");
                String fullName = rs.getString("name");
                int districtId = rs.getInt("districtId");
                createMap.put(wardId, new Ward(wardId, fullName, districtId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<Integer, District> loadDistrict() {
        Map<Integer, District> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[DistrictHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int districtId = rs.getInt("districtId");
                String fullName = rs.getString("name");
                int cityId = rs.getInt("cityId");
                createMap.put(districtId, new District(districtId, fullName, cityId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<Integer, Facility> loadFacility() {
        Map<Integer, Facility> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[FacilityHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int facilityId = rs.getInt("facilityId");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String icon = rs.getString("icon");
                createMap.put(facilityId, new Facility(facilityId, name, status, icon));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<Integer, City> loadCity() {
        Map<Integer, City> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[CityHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cityId = rs.getInt("cityId");
                String fullName = rs.getString("name");
                createMap.put(cityId, new City(cityId, fullName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<Integer, HouseType> loadHouseTypeId() {
        Map<Integer, HouseType> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[HouseTypeIdHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("houseTypeId");
                String fullName = rs.getString("name");
                createMap.put(userId, new HouseType(userId, fullName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<Integer, House> loadHouseMap() {
        Map<Integer, House> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[HouseHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int houseId = rs.getInt("houseId");
                String fullName = rs.getString("name");
                String image = rs.getString("image");
                createMap.put(houseId, new House(houseId, fullName, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public Map<Integer, RentEntityType> loadRentEntityType() {
        Map<Integer, RentEntityType> createMap = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[RentEntityTypeHE171464]";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int rentTypeId = rs.getInt("rentTypeId");
                String fullName = rs.getString("name");
                createMap.put(rentTypeId, new RentEntityType(rentTypeId, fullName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return createMap;
    }

    public boolean insert(Users u) {
        String sql = "INSERT INTO [dbo].[UsersHE171464]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[Email]\n"
                + "           ,[Fullname]\n"
                + "           ,[Gender]\n"
                + "           ,[Dob]\n"
                + "           ,[Phone]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, u.getEmail());
            st.setString(4, u.getFullname());
            st.setBoolean(5, u.isGender());
            st.setString(6, u.getDob());
            st.setString(7, u.getPhone());
            st.setInt(8, u.getRole());
            int rowsInserted = st.executeUpdate();
            st.close();
            // Check if any rows were inserted (success) or not (failure)
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false in case of an exception
        }
    }

    public boolean insertHouse(House h) {
        String sql = "INSERT INTO [dbo].[HouseHE171464] "
                + "([Name], [WardId], [Address], [Status], [Image], "
                + "[HouseTypeId], [Map], [BuildingId], [OwnerId]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, h.getName());
            if (h.getWardId() == 0) {
                preparedStatement.setNull(2, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(2, h.getWardId());
            }
            preparedStatement.setString(3, h.getAddress());
            preparedStatement.setInt(4, h.getStatus());
            preparedStatement.setString(5, h.getImage());
            if (h.getHouseTypeId() == 0) {
                preparedStatement.setNull(6, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(6, h.getHouseTypeId());
            }
            preparedStatement.setString(7, h.getMap());
            if (h.getBuildingId() == 0) {
                preparedStatement.setNull(8, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(8, h.getBuildingId());
            }
            preparedStatement.setString(9, h.getOwnerId());

            int rowsInserted = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error sql insert house: " + e);
            return false;
        }
    }

    public boolean insertRent(RentEntity r) {
        String sql = "INSERT INTO [dbo].[RentEntityHE171464]\n"
                + "           ([Name]\n"
                + "           ,[Description]\n"
                + "           ,[RentTypeId]\n"
                + "           ,[HouseId]\n"
                + "           ,[Price]\n"
                + "           ,[Area]\n"
                + "           ,[Image]\n"
                + "           ,[Status]\n"
                + "           ,[CreateTime]\n"
                + "           ,[MaxPeople]\n"
                + "           ,[UpdateBy])\n"
                + "    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, r.getName());
            preparedStatement.setString(2, r.getDescription());
            if (r.getRentTypeId() == 0) {
                preparedStatement.setNull(3, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(3, r.getRentTypeId());
            }
            if (r.getHouseId() == 0) {
                preparedStatement.setNull(4, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(4, r.getHouseId());
            }
            preparedStatement.setInt(5, r.getPrice());
            preparedStatement.setInt(6, r.getArea());
            preparedStatement.setString(7, r.getImage());
            preparedStatement.setInt(8, r.getStatus());
            preparedStatement.setString(9, r.getCreateTime());
            preparedStatement.setInt(10, r.getMaxPeople());
            preparedStatement.setString(11, r.getUpdateBy());

            int rowsInserted = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println("error sql insert rent: " + e.getMessage());
            return false;
        }
    }

    public boolean insertBuilding(Building b) {
        String sql = "INSERT INTO [dbo].[BuildingHE171464] "
                + "([Name], [WardId], [Address], [Image], [Map], [Status]) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, b.getName());
            if (b.getWardId() == 0) {
                preparedStatement.setNull(2, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(2, b.getWardId());
            }
            preparedStatement.setString(3, b.getAddress());
            preparedStatement.setString(4, b.getImage());
            preparedStatement.setString(5, b.getMap());
            preparedStatement.setInt(6, b.getStatus());
            int rowsInserted = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error sql insert building: " + e.getMessage());
            return false;
        }
    }

    public boolean insertFacility(Facility f) {
        String sql = "INSERT INTO [dbo].[FacilityHE171464]\n"
                + "           ([Name]\n"
                + "           ,[Status]\n"
                + "           ,[Icon])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, f.getName());
            preparedStatement.setInt(2, f.getStatus());
            preparedStatement.setString(3, f.getIcon());
            int rowsInserted = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error sql insert facility: " + e);
            return false;
        }
    }

    public boolean UpdatePassword(String password, String email) {
        String sql = "UPDATE [dbo].[UsersHE171464] SET [Password] = ? WHERE [Email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);
            int rowsUpdated = st.executeUpdate();
            st.close();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public void ChangePassword(String password, String username) {
        String sql = "UPDATE [dbo].[UsersHE171464] SET [Password] = ? WHERE [Username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean updateUserProfile(Users user) {
        String sql = "UPDATE [dbo].[UsersHE171464] "
                + "SET "
                + "    [Fullname] = ?, "
                + "    [Email] = ?, "
                + "    [Phone] = ?, "
                + "    [Gender] = ?, "
                + "    [Dob] = ?, "
                + "    [Image] = ?, "
                + "    [CitizenNumber] = ?, "
                + "    [CitizenNumberDate] = ? "
                + "WHERE [Username] = ? ";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getFullname());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
            statement.setBoolean(4, user.isGender());
            statement.setString(5, user.getDob());
            statement.setString(6, user.getImage());
            statement.setString(7, user.getCitizenNumber());
            statement.setString(8, user.getCitizenNumberDate());
            statement.setString(9, user.getUsername());

            int rowsAffected = statement.executeUpdate();
            System.out.println("sucess");
            return (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed");
            return false;
        }
    }

    public boolean updateUserRole(Users user) {
        String sql = "UPDATE [dbo].[UsersHE171464] "
                + "SET "
                + "    [Role] = ? "
                + "WHERE [Username] = ? ";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, user.getRole());
            statement.setString(2, user.getUsername());

            int rowsAffected = statement.executeUpdate();
            System.out.println("sucess");
            return (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed");
            return false;
        }
    }

    public Users getUserIdByUsername(String username) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[UsersHE171464]\n"
                + "  where Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"), rs.getString("Image"), rs.getString("fullname"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateHouse(House updatedHouse) {
        String sql = "UPDATE [dbo].[HouseHE171464] "
                + "SET [Name] = ?, [WardId] = ?, [Address] = ?, [Status] = ?, "
                + "[Map] = ?, [Image] = ?, [HouseTypeId] = ?, [BuildingId] = ? "
                + "WHERE [HouseId] = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, updatedHouse.getName());
            if (updatedHouse.getWardId() == 0) {
                preparedStatement.setNull(2, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(2, updatedHouse.getWardId());
            }
            preparedStatement.setString(3, updatedHouse.getAddress());
            preparedStatement.setInt(4, updatedHouse.getStatus());
            preparedStatement.setString(5, updatedHouse.getMap());
            preparedStatement.setString(6, updatedHouse.getImage());
            if (updatedHouse.getHouseTypeId() == 0) {
                preparedStatement.setNull(7, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(7, updatedHouse.getHouseTypeId());
            }
            if (updatedHouse.getBuildingId() == 0) {
                preparedStatement.setNull(8, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(8, updatedHouse.getBuildingId());
            }
            preparedStatement.setInt(9, updatedHouse.getHouseId());

            int rowsUpdated = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Error updating house in DAO: " + e);
            return false;
        }
    }

    public boolean updateRentEntity(int status, String depositBy, String depositTime, int rentEntityId) {
        String sql = "UPDATE RentEntityHE171464 SET [Status] = ?, DepositBy = ?, DepositTime = ? WHERE RentEntityId = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            if (depositBy == null && depositTime == null) {
                ps.setNull(1, java.sql.Types.INTEGER);
                ps.setNull(2, java.sql.Types.INTEGER);
            }
            ps.setInt(1, status);
            ps.setString(2, depositBy);
            ps.setString(3, (depositTime));
            ps.setInt(4, rentEntityId);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("update deposite error: " + e.getMessage());
            return false;
        }
    }

    public boolean updateRent(RentEntity updatedRent) {
        String sql = "UPDATE [dbo].[RentEntityHE171464]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[RentTypeId] = ?\n"
                + "      ,[HouseId] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Area] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[MaxPeople] = ? \n"
                + " WHERE [RentEntityId]=?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, updatedRent.getName());
            preparedStatement.setString(2, updatedRent.getDescription());
            if (updatedRent.getRentTypeId() == 0) {
                preparedStatement.setNull(3, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(3, updatedRent.getRentTypeId());
            }
            if (updatedRent.getHouseId() == 0) {
                preparedStatement.setNull(4, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(4, updatedRent.getHouseId());
            }
            preparedStatement.setInt(5, updatedRent.getPrice());
            preparedStatement.setInt(6, updatedRent.getArea());
            preparedStatement.setString(7, updatedRent.getImage());
            preparedStatement.setInt(8, updatedRent.getStatus());
            preparedStatement.setInt(9, updatedRent.getMaxPeople());
            preparedStatement.setInt(10, updatedRent.getRentEntityId());

            int rowsUpdated = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Error updating rent in DAO: " + e);
            return false;
        }
    }

    public boolean updateBuilding(Building updatedBuilding) {
        String sql = "UPDATE [dbo].[BuildingHE171464]\n"
                + "   SET [Name] = ?\n"
                + "      ,[WardId] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Map] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE [BuildingId] = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, updatedBuilding.getName());
            if (updatedBuilding.getWardId() == 0) {
                preparedStatement.setNull(2, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(2, updatedBuilding.getWardId());
            }
            preparedStatement.setString(3, updatedBuilding.getAddress());
            preparedStatement.setString(4, updatedBuilding.getMap());
            preparedStatement.setString(5, updatedBuilding.getImage());
            preparedStatement.setInt(6, updatedBuilding.getStatus());
            preparedStatement.setInt(7, updatedBuilding.getBuildingId());

            int rowsUpdated = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Error updating building in DAO: " + e);
            return false;
        }
    }

    public boolean updateFacility(Facility f) {
        String sql = "UPDATE [dbo].[FacilityHE171464]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[Icon] = ?\n"
                + " WHERE [FacilityId]=?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, f.getName());
            preparedStatement.setInt(2, f.getStatus());
            preparedStatement.setString(3, f.getIcon());
            preparedStatement.setInt(4, f.getFacilityId());

            int rowsUpdated = preparedStatement.executeUpdate();
            preparedStatement.close();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Error updating facility in DAO: " + e);
            return false;
        }
    }

    public List<RentEntity> searchRentEntities(int wardID, int districtID, int cityID, int rentTypeID, String txt) {
        List<RentEntity> rentEntities = new ArrayList<>();

        try {
//            String sql = "SELECT * FROM RentEntityHE171464 re "
//                    + "JOIN HouseHE171464 h ON re.houseId = h.houseId "
//                    + "JOIN WardHE171464 w ON h.WardID = w.WardID "
//                    + "JOIN DistrictHE171464 d ON w.DistrictID = d.DistrictID "
//                    + "JOIN CityHE171464 c ON d.CityID = c.CityID "
//                    + "WHERE c.CityID = ? AND d.DistrictID = ? AND w.WardID = ? "
//                    + "AND re.RentTypeID = ? AND re.Name LIKE ?";
            String sql = "SELECT re.* "
                    + "FROM HouseHE171464 h "
                    + "LEFT JOIN RentEntityHE171464 re ON h.houseId = re.houseId "
                    + "LEFT JOIN WardHE171464 w ON h.WardID = w.WardID "
                    + "LEFT JOIN DistrictHE171464 d ON w.DistrictID = d.DistrictID "
                    + "LEFT JOIN CityHE171464 c ON d.CityID = c.CityID "
                    + "WHERE w.WardId = ? AND d.DistrictId = ? AND c.CityId = ? AND re.RentTypeID = ? AND h.name LIKE ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, wardID);
            preparedStatement.setInt(2, districtID);
            preparedStatement.setInt(3, cityID);
            preparedStatement.setInt(4, rentTypeID);
            preparedStatement.setString(5, "%" + txt + "%");

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                RentEntity rentEntity = new RentEntity(rs.getInt("rentEntityId"), rs.getString("name"), rs.getString("description"),
                        rs.getInt("rentTypeId"), rs.getInt("houseId"), rs.getInt("price"),
                        rs.getInt("area"), rs.getString("image"), rs.getInt("maxPeople"));

                rentEntities.add(rentEntity);
            }

            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rentEntities;
    }

    public List<RentEntity> search(String txt) {
        List<RentEntity> rentEntities = new ArrayList<>();

        try {
//            String sql = "SELECT * FROM RentEntityHE171464 re "
//                    + "JOIN HouseHE171464 h ON re.houseId = h.houseId "
//                    + "JOIN WardHE171464 w ON h.WardID = w.WardID "
//                    + "JOIN DistrictHE171464 d ON w.DistrictID = d.DistrictID "
//                    + "JOIN CityHE171464 c ON d.CityID = c.CityID "
//                    + "WHERE c.CityID = ? AND d.DistrictID = ? AND w.WardID = ? "
//                    + "AND re.RentTypeID = ? AND re.Name LIKE ?";
            String sql = "SELECT re.* "
                    + "FROM HouseHE171464 h "
                    + "LEFT JOIN RentEntityHE171464 re ON h.houseId = re.houseId "
                    + "LEFT JOIN WardHE171464 w ON h.WardID = w.WardID "
                    + "LEFT JOIN DistrictHE171464 d ON w.DistrictID = d.DistrictID "
                    + "LEFT JOIN CityHE171464 c ON d.CityID = c.CityID "
                    + "where h.name LIKE ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + txt + "%");

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                RentEntity rentEntity = new RentEntity(rs.getInt("rentEntityId"), rs.getString("name"), rs.getString("description"),
                        rs.getInt("rentTypeId"), rs.getInt("houseId"), rs.getInt("price"),
                        rs.getInt("area"), rs.getString("image"), rs.getInt("maxPeople"));

                rentEntities.add(rentEntity);
            }

            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rentEntities;
    }

    public boolean delete(String table, String nameId, int id) {
        String sql = "DELETE FROM [dbo].[" + table + "] WHERE [" + nameId + "]= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; // If rowsAffected > 0, deletion was successful.
        } catch (SQLException e) {
            System.out.println("Error delete: " + e.getMessage());
            return false; // Deletion failed.
        }
    }

    public boolean delete(String table, String nameId, String username) {
        String sql = "DELETE FROM [dbo].[" + table + "] WHERE [" + nameId + "]= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; // If rowsAffected > 0, deletion was successful.
        } catch (SQLException e) {
            System.out.println("Error delete: " + e.getMessage());
            return false; // Deletion failed.
        }
    }

    public static void main(String[] args) {
//        int cityID = 1;
//        int districtID = 24;
//        int wardID = 319;
//        int rentTypeID = 1;
//        String txt = "H";
//        
//        List<RentEntity> results = DAO.INSTANCE.searchRentEntities(wardID, districtID, cityID, rentTypeID, txt);
//        Map<Integer, Users> createMap = DAO.INSTANCE.loadCreateBy();
//        // Display the search results
//        for (Map.Entry<Integer, Users> entry : createMap.entrySet()) {
//            int userId = entry.getKey();
//            Users user = entry.getValue();
//            
//            System.out.println("User ID: " + userId);
//            System.out.println("Full Name: " + user.getFullname());
//            System.out.println("Image: " + user.getImage());
//            System.out.println("Email: " + user.getEmail());
//            System.out.println("Phone: " + user.getPhone());
//            System.out.println();
//        }
        List<RentEntity> list = DAO.INSTANCE.getRentEntityDeposit("minhanh");
        for (RentEntity rentEntity : list) {
            System.out.println(rentEntity.getDepositBy());
            System.out.println(rentEntity.getDepositTime());
            System.out.println(rentEntity.getStatus());
            System.out.println("--------------");
        }

    }
}
