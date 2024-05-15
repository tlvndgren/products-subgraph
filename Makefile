create:
	wgc subgraph create products \
    --namespace default \
    --label team=B \
    --routing-url https://prod-products-subgraph-bhl6lhslfa-uc.a.run.app

publish:
	wgc subgraph publish products --schema ./products.graphql

delete:
	wgc subgraph delete products -f

check:
	wgc subgraph check products --schema ./products.graphql