# Example go-todo-list Helm chart

## How to use

Clone this repo localy:
````
git clone https://github.com/ccleouf66/example-go-todo-list-chart.git
````

Update the `values.yaml` with your MongoDB creds:
```yaml
...
     MONGO_ADDR: "mongodb+srv://mongodb-9025f544-o789a28da.database.cloud.ovh.net"
     MONGO_USR: "demo"
     MONGO_PWD: ""
     MONGO_DB: "demo"
     MONGO_RS: "replicaset"
     MONGO_AUTH_SOURCE: "admin"
...
```

Install this app to your kubernetes cluster:
````
helm install my-todo-list-app -n demo-todo --create-namespace -f values.yaml .
````
