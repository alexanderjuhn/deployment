echo 'Delete PROD'
helm delete prod-frontend
helm delete prod-backend
echo

echo 'Delete DEV'
helm delete dev-frontend
helm delete dev-backend
echo

echo 'Install PROD'
helm install prod-backend RoomAppsBackend -f /home/sascha/1_Dev/90_Repo/06_config/config/helm/RoomApps/prod/backend_values.yaml 
helm install prod-frontend RoomAppsFrontend -f /home/sascha/1_Dev/90_Repo/06_config/config/helm/RoomApps/prod/frontend_values.yaml
echo

echo 'Install DEV'
helm install dev-frontend RoomAppsFrontend -f /home/sascha/1_Dev/90_Repo/06_config/config/helm/RoomApps/dev/frontend_values.yaml 
helm install dev-backend RoomAppsBackend -f /home/sascha/1_Dev/90_Repo/06_config/config/helm/RoomApps/dev/backend_values.yaml 
echo