from django.urls import path
from AssetManagementApp.views import AssetCategoryView, AssetCategoryByIdView, LocationView, LocationByIdView, RoomByIdView, UserView, UserByIdView, StatusView, StatusByIdView, SupplierView, SupplierByIdView, AssetView, AssetByIdView, AssignAssetToRoomView, UnassignAssetToRoomView, AssignAssetToEmployeeView, UnassignAssetToEmployeeView, AssetImportView, AssetExportView


urlpatterns = [
    path('category/', AssetCategoryView.as_view(), name='category'),
    path('category/<int:pk>/', AssetCategoryByIdView.as_view(), name='categoryById'),
    path('location/', LocationView.as_view(), name='location'),
    path('location/<int:pk>/', LocationByIdView.as_view(), name='locationById'),
    path('location/<int:pk>/room/', RoomByIdView.as_view(), name='roomById'),
    path('employee/', UserView.as_view(), name='employee'),
    path('employee/<int:pk>/', UserByIdView.as_view(), name='employeeById'),
    path('status/', StatusView.as_view(), name='status'),
    path('status/<int:pk>/', StatusByIdView.as_view(), name='statusById'),
    path('supplier/', SupplierView.as_view(), name='supplier'),
    path('supplier/<int:pk>/', SupplierByIdView.as_view(), name='supplierById'),
    path('asset/', AssetView.as_view(), name='asset'),
    path('asset/<int:pk>/', AssetByIdView.as_view(), name='assetById'),
    path('asset/<int:pk>/status/', AssetByIdView.as_view(), name='assetStatus'),
    path('asset/<int:pk>/room/assign/', AssignAssetToRoomView.as_view(), name='assignAssetToRoom'),
    path('asset/<int:pk>/room/unassign/', UnassignAssetToRoomView.as_view(), name='unassignAssetToRoom'),
    path('asset/<int:pk>/employee/assign/', AssignAssetToEmployeeView.as_view(), name='assignAssetToEmployee'),
    path('asset/<int:pk>/employee/unassign/', UnassignAssetToEmployeeView.as_view(), name='unassignAssetToEmployee'),
    path('asset/import/', AssetImportView.as_view(), name='importAssetT'),
    path('asset/export/', AssetExportView.as_view(), name='exportAssetT')
]

