import "NFTCatalog"

access(all) fun main(): {String : NFTCatalog.NFTCatalogMetadata} {
    return NFTCatalog.getCatalog()
}