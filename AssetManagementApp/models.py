from django.db import models

# Create your models here.

class AssetCategory(models.Model):
    __tablename__ = 'asset_category'
    asset_category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=100)
    description = models.CharField(max_length=500, blank=True, null=True)
    is_laptop = models.BooleanField(blank=False)

class Location(models.Model):
    location_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=500, blank=True, null=True)

class Room(models.Model):
    room_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    location_id = models.ForeignKey("Location", on_delete=models.CASCADE)
    description = models.CharField(max_length=500, blank=True, null=True)

class User(models.Model):
    employee_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    mobile_no = models.IntegerField()

class Status(models.Model):
    status_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    color_code = models.CharField(max_length=50)
    type = models.CharField(max_length=50, blank=True, null=True)
    show_on_dashboard_code = models.BooleanField(blank=False)
    is_default_for_status = models.BooleanField(blank=False)
    description = models.CharField(max_length=500)

class Supplier(models.Model):
    supplier_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=500, blank=True, null=True)
    email = models.CharField(max_length=50)
    mobile_no = models.IntegerField()

class Asset(models.Model):
    asset_id = models.AutoField(primary_key=True)
    asset_code = models.CharField(max_length=50)
    asset_category_id = models.ForeignKey("AssetCategory", blank=True, null=True, on_delete=models.CASCADE)
    status_id = models.ForeignKey("Status", blank=True, null=True, on_delete=models.CASCADE)
    employee_id = models.ForeignKey("User", blank=True, null=True, on_delete=models.CASCADE)
    room_id = models.ForeignKey("Room", blank=True, null=True, on_delete=models.CASCADE)
    model = models.CharField(max_length=50)
    company_name = models.CharField(max_length=100)
    serial_number = models.IntegerField()
    purchase_date = models.DateField(blank=True, null=True)
    purchase_cost = models.IntegerField(blank=True, null=True)
    supplier_id = models.ForeignKey("Supplier", blank=True, null=True, on_delete=models.CASCADE)
    warranty = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=500, blank=True, null=True)

class Permission(models.Model):
    permission_id = models.AutoField(primary_key=True)
    module = models.CharField(max_length=100)
    user_id = models.ForeignKey("User", blank=True, null=True, on_delete=models.CASCADE)
    value = models.BooleanField(blank=False)

class Laptop(models.Model):
    laptop_id = models.AutoField(primary_key=True)
    asset_id = models.IntegerField()
    wifi_mac_address = models.CharField(max_length=50)
    lan_mac_address = models.CharField(max_length=50)
    os = models.CharField(max_length=50)
    processor = models.CharField(max_length=50)
    ram = models.CharField(max_length=50)
    disk_type = models.CharField(max_length=50)
    disk_capacity = models.CharField(max_length=50)
    is_cisco_product = models.BooleanField(blank=False)
    is_cloudops_product = models.BooleanField(blank=False)
    is_splunk_product = models.BooleanField(blank=False)
    splunk_id = models.CharField(max_length=50)
    description = models.CharField(max_length=500)

