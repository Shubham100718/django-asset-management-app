from django.urls import path
from AssetManagementApp import views 


urlpatterns = [
    path('api/category', views.AssetCategoryApi),
    path('api/category/<int:pk>', views.AssetCategoryByIdApi),
    path('api/location', views.LocationApi),
    path('api/location/<int:pk>', views.LocationByIdApi),
    path('api/location/<int:pk>/room', views.RoomByIdApi),
    path('api/employee', views.UserApi),
    path('api/employee/<int:pk>', views.UserByIdApi),
    path('api/status', views.StatusApi),
    path('api/status/<int:pk>', views.StatusByIdApi),
    path('api/supplier', views.SupplierApi),
    path('api/supplier/<int:pk>', views.SupplierByIdApi),
    path('api/asset', views.AssetApi),
    path('api/asset/<int:pk>', views.AssetByIdApi),
    path('api/asset/<int:pk>/status', views.AssetByIdApi),
    path('api/asset/<int:pk>/room/assign', views.AssignAssetToRoomApi),
    path('api/asset/<int:pk>/room/unassign', views.UnassignAssetToRoomApi),
    path('api/asset/<int:pk>/employee/assign', views.AssignAssetToEmployeeApi),
    path('api/asset/<int:pk>/employee/unassign', views.UnassignAssetToEmployeeApi),
    path('api/asset/import', views.AssetImportApi),
    path('api/asset/export', views.AssetExportApi)
]

