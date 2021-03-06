export COUCHBASE_CLI=/Users/arungupta/tools/Couchbase-Server-4.0.app/Contents/Resources/couchbase-core/bin/couchbase-cli
$COUCHBASE_CLI \
	xdcr-setup \
	--cluster=$(docker-machine ip swarm-master-$1):8091 \
	--user Administrator \
	--password password \
	--create \
	--xdcr-cluster-name=cluster$1 \
	--xdcr-hostname=$(docker-machine ip swarm-master-$2):8091 \
	--xdcr-username=Administrator \
	--xdcr-password=password \
	--xdcr-demand-encryption=0

$COUCHBASE_CLI \
	xdcr-replicate \
	--cluster $(docker-machine ip swarm-master-$1):8091 \
	--xdcr-cluster-name=cluster$1 \
	--user Administrator \
	--password password \
	--create \
	--xdcr-from-bucket=travel-sample \
	--xdcr-to-bucket=travel-sample

