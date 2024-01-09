from rest_framework import serializers 
from AssetManagementApp.models import AssetCategory, Location, Room, User, Status, Supplier, Asset, Permission, Laptop
 
 
class AssetCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = AssetCategory
        fields = ['asset_category_id','category_name','description','is_laptop']

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ['location_id','name','description']

class RoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = Room
        fields = ['room_id','name','location_id','description']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['employee_id','first_name','last_name','email','mobile_no']

class StatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Status
        fields = ['status_id','name','color_code','type','show_on_dashboard_code','is_default_for_status','description']

class SupplierSerializer(serializers.ModelSerializer):
    class Meta:
        model = Supplier
        fields = ['supplier_id','name','description','email','mobile_no']

class AssetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Asset
        fields = ['asset_id','asset_code','asset_category_id','status_id','employee_id','room_id','model','company_name','serial_number','purchase_date','purchase_cost','supplier_id','warranty','description']

class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Permission
        fields = ['permission_id','module','user_id','value']

class LaptopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Laptop
        fields = ['laptop_id','asset_id','wifi_mac_address','lan_mac_address','os','processor','ram','disk_type','disk_capacity','is_cisco_product','is_cloudops_product','is_splunk_product','splunk_id','description']

