import csv
import codecs
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.http import HttpResponse
from django.http import Http404
from AssetManagementApp.models import AssetCategory, Location, Room, User, Status, Supplier, Asset, Permission, Laptop
from AssetManagementApp.serializers import AssetCategorySerializer, LocationSerializer, RoomSerializer, UserSerializer, StatusSerializer, SupplierSerializer, AssetSerializer, PermissionSerializer, LaptopSerializer


# Create your views here.

class AssetCategoryView(APIView):
    def get(self, request, format=None):
        asset_categories = AssetCategory.objects.all()
        serializer = AssetCategorySerializer(asset_categories, many=True)
        return Response({
            'msg':'Fetched All Assets Category Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)
    
    def post(self, request, format=None):
        serializer = AssetCategorySerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'New Asset Category Created Successfully.',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)
    

class AssetCategoryByIdView(APIView):
    def get_object(self, pk, format=None):
        try:
            return AssetCategory.objects.get(pk=pk)
        except AssetCategory.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        asset_category = self.get_object(pk)
        serializer = AssetCategorySerializer(asset_category)
        return Response({
            'msg':'Fetched Asset Category Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)

    def put(self, request, pk, format=None):
        asset_category = self.get_object(pk)
        serializer = AssetCategorySerializer(asset_category, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Asset Category Updated Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)

    def delete(self, request, pk, format=None):
        asset_category = self.get_object(pk)
        asset_category.delete()
        return Response({
            'msg':'Asset Category Deleted Successfully'
        }, status=status.HTTP_200_OK)


class LocationView(APIView):
    def get(self, request, format=None):
        locations = Location.objects.all()
        serializer = LocationSerializer(locations, many=True)
        return Response({
            'msg':'Fetched All Locations Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)
    
    def post(self, request, format=None):
        serializer = LocationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'New Location Created Successfully.',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)
    

class LocationByIdView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Location.objects.get(pk=pk)
        except Location.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        location = self.get_object(pk)
        serializer = LocationSerializer(location)
        return Response({
            'msg':'Fetched Location Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)

    def put(self, request, pk, format=None):
        location = self.get_object(pk)
        serializer = LocationSerializer(location, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Location Updated Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)

    def delete(self, request, pk, format=None):
        location = self.get_object(pk)
        location.delete()
        return Response({
            'msg':'Location Deleted Successfully'
        }, status=status.HTTP_200_OK)


class RoomByIdView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Room.objects.filter(location_id=pk).all()
        except Room.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        rooms = self.get_object(pk)
        room_list = []
        for room in rooms:
            serializer = RoomSerializer(room)
            room_list.append(serializer.data)
        return Response({
            'msg':'Fetched Room Successfully',
            'data': room_list
        },status=status.HTTP_200_OK)


class UserView(APIView):
    def get(self, request, format=None):
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response({
            'msg':'Fetched All Users Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)


class UserByIdView(APIView):
    def get_object(self, pk, format=None):
        try:
            return User.objects.get(pk=pk)
        except User.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        user = self.get_object(pk)
        serializer = UserSerializer(user)
        return Response({
            'msg':'Fetched User Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)


class StatusView(APIView):
    def get(self, request, format=None):
        status_data = Status.objects.all()
        serializer = StatusSerializer(status_data, many=True)
        return Response({
            'msg':'Fetched All Status Successfully',
            'data': serializer.data
        }, status=status.HTTP_200_OK)
    
    def post(self, request, format=None):
        serializer = StatusSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'New Status Created Successfully.',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class StatusByIdView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Status.objects.get(pk=pk)
        except Status.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        status_data = self.get_object(pk)
        serializer = StatusSerializer(status_data)
        return Response({
            'msg':'Fetched Status Successfully',
            'data': serializer.data
        }, status=status.HTTP_200_OK)

    def delete(self, request, pk, format=None):
        status_data = self.get_object(pk)
        status_data.delete()
        return Response({
            'msg':'Status Deleted Successfully'
        }, status=status.HTTP_200_OK)


class SupplierView(APIView):
    def get(self, request, format=None):
        suppliers = Supplier.objects.all()
        serializer = SupplierSerializer(suppliers, many=True)
        return Response({
            'msg':'Fetched All Suppliers Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)
    
    def post(self, request, format=None):
        serializer = SupplierSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'New Supplier Created Successfully.',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class SupplierByIdView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Supplier.objects.get(pk=pk)
        except Supplier.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        supplier = self.get_object(pk)
        serializer = SupplierSerializer(supplier)
        return Response({
            'msg':'Fetched Supplier Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)

    def put(self, request, pk, format=None):
        supplier = self.get_object(pk)
        serializer = SupplierSerializer(supplier, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Supplier Updated Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)

    def delete(self, request, pk, format=None):
        supplier = self.get_object(pk)
        supplier.delete()
        return Response({
            'msg':'Supplier Deleted Successfully'
        }, status=status.HTTP_200_OK)


class AssetView(APIView):
    def get(self, request, format=None):
        assets = Asset.objects.all()
        serializer = AssetSerializer(assets, many=True)
        return Response({
            'msg':'Fetched All Assets Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)
    
    def post(self, request, format=None):
        serializer = AssetSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'New Asset Created Successfully.',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class AssetByIdView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Asset.objects.get(pk=pk)
        except Asset.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        asset = self.get_object(pk)
        serializer = AssetSerializer(asset)
        return Response({
            'msg':'Fetched Asset Successfully',
            'data': serializer.data
        },status=status.HTTP_200_OK)

    def put(self, request, pk, format=None):
        asset = self.get_object(pk)
        serializer = AssetSerializer(asset, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Asset Updated Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)

    def delete(self, request, pk, format=None):
        asset = self.get_object(pk)
        asset.delete()
        return Response({
            'msg':'Asset Deleted Successfully'
        }, status=status.HTTP_200_OK)
    
    def patch(self, request, pk, format=None):
        asset = self.get_object(pk)
        serializer = AssetSerializer(asset, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Update Asset Status Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class AssignAssetToRoomView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Asset.objects.get(pk=pk)
        except Asset.DoesNotExist:
            raise Http404

    def patch(self, request, pk, format=None):
        asset = self.get_object(pk)
        serializer = AssetSerializer(asset, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Assign Asset To Room Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class UnassignAssetToRoomView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Asset.objects.get(pk=pk)
        except Asset.DoesNotExist:
            raise Http404

    def patch(self, request, pk, format=None):
        asset = self.get_object(pk)
        serializer = AssetSerializer(asset, data={'room_id':None}, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Unassign Asset To Room Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class AssignAssetToEmployeeView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Asset.objects.get(pk=pk)
        except Asset.DoesNotExist:
            raise Http404

    def patch(self, request, pk, format=None):
        asset = self.get_object(pk)
        serializer = AssetSerializer(asset, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Assign Asset To Employee Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class UnassignAssetToEmployeeView(APIView):
    def get_object(self, pk, format=None):
        try:
            return Asset.objects.get(pk=pk)
        except Asset.DoesNotExist:
            raise Http404

    def patch(self, request, pk, format=None):
        asset = self.get_object(pk)
        serializer = AssetSerializer(asset, data={'employee_id':None}, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({
            'msg':'Unassign Asset To Employee Successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class AssetImportView(APIView):
    def post(self, request, format=None):
        file = request.FILES.get("file")
        reader = csv.DictReader(codecs.iterdecode(file, "utf-8"), delimiter=",")
        assets = list(reader)
        serializer = AssetSerializer(data=assets, many=True, partial=True)
        serializer.is_valid(raise_exception=True)
        product_list = []
        for row in serializer.data:
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
        return Response({
            'msg':'Upload Asset File Successfully.',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)


class AssetExportView(APIView):
    def get(self, request, format=None):
        response = HttpResponse(content_type='text/csv')
        writer = csv.writer(response)
        writer.writerow(['asset_code','model','company_name','serial_number','description'])
        for asset in Asset.objects.all().values_list('asset_code','model','company_name','serial_number','description'):
            writer.writerow(asset)
        response['Content-Disposition'] = 'attachment; filename="assets.csv"'
        return response

