import csv, codecs
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
from django.http import HttpResponse
from AssetManagementApp.models import AssetCategory, Location, Room, User, Status, Supplier, Asset, Permission, Laptop
from AssetManagementApp.serializers import AssetCategorySerializer, LocationSerializer, RoomSerializer, UserSerializer, StatusSerializer, SupplierSerializer, AssetSerializer, PermissionSerializer, LaptopSerializer


# Create your views here.

@csrf_exempt
def AssetCategoryApi(request):
    if request.method=='GET':
        asset_categories = AssetCategory.objects.all()
        asset_category_serializer = AssetCategorySerializer(asset_categories,many=True)
        return JsonResponse({
            "status": True,
            "message": "Fetched All Asset Categories Successfully.",
            'data': asset_category_serializer.data
        },safe=False)
    
    elif request.method=='POST':
        asset_category_data = JSONParser().parse(request)
        asset_category_serializer = AssetCategorySerializer(data=asset_category_data)
        if asset_category_serializer.is_valid():
            asset_category_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "New Asset Category Created Successfully."
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Add New Asset Category."
        },safe=False)


@csrf_exempt
def AssetCategoryByIdApi(request,pk):
    try:
        asset_category = AssetCategory.objects.get(pk=pk)
    except AssetCategory.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Asset Category with id: {pk} does not exist."
        },status=404)
    
    if request.method=='GET':
        asset_category_serializer = AssetCategorySerializer(asset_category)
        return JsonResponse({
            "status": True,
            "message": "Fetched Asset Category Successfully.",
            'data': asset_category_serializer.data
        },safe=False)
    
    elif request.method=='PUT':
        asset_category_data = JSONParser().parse(request)
        asset_category_serializer = AssetCategorySerializer(asset_category,data=asset_category_data)
        if asset_category_serializer.is_valid():
            asset_category_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Asset Category Updated Successfully.",
                'data': asset_category_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Update Asset Category."
        },safe=False)

    elif request.method=='DELETE':
        asset_category.delete()
        return JsonResponse({
            "status": True,
            "message": "Asset Category Deleted Successfully."
        },safe=False)


@csrf_exempt
def LocationApi(request):
    if request.method=='GET':
        locations = Location.objects.all()
        locations_serializer = LocationSerializer(locations,many=True)
        return JsonResponse({
            "status": True,
            "message": "Fetched All Locations Successfully.",
            'data': locations_serializer.data
        },safe=False)
    
    elif request.method=='POST':
        location_data = JSONParser().parse(request)
        locations_serializer = LocationSerializer(data=location_data)
        if locations_serializer.is_valid():
            locations_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "New Location Created Successfully."
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Add New Location."
        },safe=False)


@csrf_exempt
def LocationByIdApi(request,pk):
    try:
        location = Location.objects.get(pk=pk)
    except Location.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Location with id: {pk} does not exist."
        },status=404)
    
    if request.method=='GET':
        location_serializer = LocationSerializer(location)
        return JsonResponse({
            "status": True,
            "message": "Fetched Location Successfully.",
            'data': location_serializer.data
        },safe=False)
    
    elif request.method=='PUT':
        location_data = JSONParser().parse(request)
        location_serializer = LocationSerializer(location,data=location_data)
        if location_serializer.is_valid():
            location_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Location Updated Successfully.",
                'data': location_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Update Location."
        },safe=False)

    elif request.method=='DELETE':
        location.delete()
        return JsonResponse({
            "status": True,
            "message": "Location Deleted Successfully."
        },safe=False)


@csrf_exempt
def RoomByIdApi(request,pk):
    rooms = Room.objects.filter(location_id=pk).all()
    if not rooms:
        return JsonResponse({
            "status": False,
            "message": f"The Room with id: {pk} does not exist."
        },status=404)
    
    if request.method=='GET':
        room_list = []
        for room in rooms:
            room_serializer = RoomSerializer(room)
            room_list.append(room_serializer.data)
        return JsonResponse({
            "status": True,
            "message": "Fetched Room Successfully.",
            'data': room_list
        },safe=False)


@csrf_exempt
def UserApi(request):
    if request.method=='GET':
        users = User.objects.all()
        user_serializer = UserSerializer(users,many=True)
        return JsonResponse({
            "status": True,
            "message": "Fetched All Users Successfully.",
            'data': user_serializer.data
        },safe=False)
    

@csrf_exempt
def UserByIdApi(request,pk):
    try:
        asset = User.objects.get(pk=pk)
    except User.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The User with id: {pk} does not exist."
        },status=404)
    
    if request.method=='GET':
        user_serializer = UserSerializer(asset)
        return JsonResponse({
            "status": True,
            "message": "Fetched User Successfully.",
            'data': user_serializer.data
        },safe=False)


@csrf_exempt
def StatusApi(request):
    if request.method=='GET':
        status = Status.objects.all()
        status_serializer = StatusSerializer(status,many=True)
        return JsonResponse({
            "status": True,
            "message": "Fetched All Status Successfully.",
            'data': status_serializer.data
        },safe=False)
    
    elif request.method=='POST':
        status_data = JSONParser().parse(request)
        status_serializer = StatusSerializer(data=status_data)
        if status_serializer.is_valid():
            status_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "New Status Created Successfully."
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Add New Status."
        },safe=False)


@csrf_exempt
def StatusByIdApi(request,pk):
    try:
        status = Status.objects.get(pk=pk)
    except Status.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Status with id: {pk} does not exist."
        },status=404)
    
    if request.method=='GET':
        status_serializer = StatusSerializer(status)
        return JsonResponse({
            "status": True,
            "message": "Fetched Status Successfully.",
            'data': status_serializer.data
        },safe=False)

    elif request.method=='DELETE':
        status.delete()
        return JsonResponse({
            "status": True,
            "message": "Status Deleted Successfully."
        },safe=False)


@csrf_exempt
def SupplierApi(request):
    if request.method=='GET':
        suppliers = Supplier.objects.all()
        supplier_serializer = SupplierSerializer(suppliers,many=True)
        return JsonResponse({
            "status": True,
            "message": "Fetched All Suppliers Successfully.",
            'data': supplier_serializer.data
        },safe=False)
    
    elif request.method=='POST':
        supplier_data = JSONParser().parse(request)
        supplier_serializer = SupplierSerializer(data=supplier_data)
        if supplier_serializer.is_valid():
            supplier_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "New Supplier Created Successfully."
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Add New Supplier."
        },safe=False)


@csrf_exempt
def SupplierByIdApi(request,pk):
    try:
        supplier = Supplier.objects.get(pk=pk)
    except Location.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Supplier with id: {pk} does not exist."
        },status=404)
    
    if request.method=='GET':
        supplier_serializer = SupplierSerializer(supplier)
        return JsonResponse({
            "status": True,
            "message": "Fetched Supplier Successfully.",
            'data': supplier_serializer.data
        },safe=False)
    
    elif request.method=='PUT':
        supplier_data = JSONParser().parse(request)
        supplier_serializer = SupplierSerializer(supplier,data=supplier_data)
        if supplier_serializer.is_valid():
            supplier_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Supplier Updated Successfully.",
                'data': supplier_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Update Supplier."
        },safe=False)

    elif request.method=='DELETE':
        supplier.delete()
        return JsonResponse({
            "status": True,
            "message": "Supplier Deleted Successfully."
        },safe=False)


@csrf_exempt
def AssetApi(request):
    if request.method=='GET':
        assets = Asset.objects.all()
        asset_serializer = AssetSerializer(assets,many=True)
        return JsonResponse({
            "status": True,
            "message": "Fetched All Assets Successfully.",
            'data': asset_serializer.data
        },safe=False)
    
    elif request.method=='POST':
        asset_data = JSONParser().parse(request)
        asset_serializer = AssetSerializer(data=asset_data)
        if asset_serializer.is_valid():
            asset_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "New Asset Created Successfully."
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Add New Asset."
        },safe=False)


@csrf_exempt
def AssetByIdApi(request,pk):
    try:
        asset = Asset.objects.get(pk=pk)
    except Asset.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Asset with id: {pk} does not exist."
        },status=404)
    
    if request.method=='GET':
        asset_serializer = AssetSerializer(asset)
        return JsonResponse({
            "status": True,
            "message": "Fetched Asset Successfully.",
            'data': asset_serializer.data
        },safe=False)
    
    elif request.method=='PUT':
        asset_data = JSONParser().parse(request)
        asset_serializer = AssetSerializer(asset,data=asset_data)
        if asset_serializer.is_valid():
            asset_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Asset Updated Successfully.",
                'data': asset_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Update Asset."
        },safe=False)

    elif request.method=='DELETE':
        asset.delete()
        return JsonResponse({
            "status": True,
            "message": "Asset Deleted Successfully."
        },safe=False)

    elif request.method=='PATCH':
        asset_data = JSONParser().parse(request)
        asset_serializer = AssetSerializer(asset,data=asset_data,partial=True)
        if asset_serializer.is_valid():
            asset_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Update Asset Status Successfully.",
                'data': asset_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Update Asset Status."
        },safe=False)


@csrf_exempt
def AssignAssetToRoomApi(request,pk):
    try:
        asset = Asset.objects.get(pk=pk)
    except Asset.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Asset with id: {pk} does not exist."
        },status=404)

    if request.method=='PATCH':
        asset_data = JSONParser().parse(request)
        asset_serializer = AssetSerializer(asset,data=asset_data,partial=True)
        if asset_serializer.is_valid():
            asset_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Assign Asset To Room Successfully.",
                'data': asset_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Assign Asset."
        },safe=False)


@csrf_exempt
def UnassignAssetToRoomApi(request,pk):
    try:
        asset = Asset.objects.get(pk=pk)
    except Asset.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Asset with id: {pk} does not exist."
        },status=404)

    if request.method=='PATCH':
        asset_serializer = AssetSerializer(asset,data={'room_id':None},partial=True)
        if asset_serializer.is_valid():
            asset_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Unassign Asset To Room Successfully.",
                'data': asset_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Unassign Asset."
        },safe=False)


@csrf_exempt
def AssignAssetToEmployeeApi(request,pk):
    try:
        asset = Asset.objects.get(pk=pk)
    except Asset.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Asset with id: {pk} does not exist."
        },status=404)

    if request.method=='PATCH':
        asset_data = JSONParser().parse(request)
        asset_serializer = AssetSerializer(asset,data=asset_data,partial=True)
        if asset_serializer.is_valid():
            asset_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Assign Asset To Employee Successfully.",
                'data': asset_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Assign Employee."
        },safe=False)


@csrf_exempt
def UnassignAssetToEmployeeApi(request,pk):
    try:
        asset = Asset.objects.get(pk=pk)
    except Asset.DoesNotExist:
        return JsonResponse({
            "status": False,
            "message": f"The Asset with id: {pk} does not exist."
        },status=404)

    if request.method=='PATCH':
        asset_serializer = AssetSerializer(asset,data={'employee_id':None},partial=True)
        if asset_serializer.is_valid():
            asset_serializer.save()
            return JsonResponse({
                "status": True,
                "message": "Unassign Asset To Employee Successfully.",
                'data': asset_serializer.data
            },safe=False)
        return JsonResponse({
            "status": False,
            "message": "Failed to Unassign Employee."
        },safe=False)


@csrf_exempt
def AssetImportApi(request):
    if request.method=='POST':
        file = request.FILES.get("file")
        reader = csv.DictReader(codecs.iterdecode(file, "utf-8"), delimiter=",")
        assets = list(reader)
        asset_serializer = AssetSerializer(data=assets, many=True, partial=True)
        asset_serializer.is_valid(raise_exception=True)
        product_list = []
        for row in asset_serializer.data:
            product_list.append(
                Asset(
                    asset_code = row["asset_code"],
                    model = row["model"],
                    company_name = row["company_name"],
                    serial_number = row["serial_number"],
                    description = row["description"]
                )
            )
        Asset.objects.bulk_create(product_list)
        return JsonResponse({
            "status": True,
            "message": "Upload Asset File Successfully."
        },safe=False)
        

@csrf_exempt
def AssetExportApi(request):
    if request.method=='GET':
        response = HttpResponse(content_type='text/csv')
        writer = csv.writer(response)
        writer.writerow(['asset_code','model','company_name','serial_number','description'])
        for asset in Asset.objects.all().values_list('asset_code','model','company_name','serial_number','description'):
            writer.writerow(asset)
        response['Content-Disposition'] = 'attachment; filename="assets.csv"'
        return response

