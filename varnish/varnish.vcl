#
# This puts varnish in front of virtuoso.
#
vcl 4.0;

# Default backend definition. Set this to point to your content server.
backend default {
    .host = "<BACKEND_HOST>";
    .port = "<BACKEND_PORT>";
    .connect_timeout = 90s;
    .between_bytes_timeout = 30s;
}

sub vcl_recv {
    # Happens before we check if we have this in cache already.
    #
    # Typically you clean up the request here, removing cookies you don't need,
    # rewriting the request, etc.

    # Just put everything in cache.
    return(hash);
}

sub vcl_backend_response {
    # Happens after we have read the response headers from the backend.
    #
    # Here you clean the response headers, removing silly Set-Cookie headers
    # and other mistakes your backend does.

    # We set TTL to a looong time.
    set beresp.ttl = 99999h;

    if(beresp.status == 404) {
          # Cache 404 responses for 15 seconds
          set beresp.ttl = 15s;
          set beresp.grace = 15s;
    }
}

sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #

    # Set CORS headers so snorql works
    set resp.http.Access-Control-Allow-Origin = "*";
    set resp.http.Access-Control-Allow-Methods = "GET, OPTIONS";
    set resp.http.Access-Control-Allow-Headers = "Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token";
    # You can do accounting or modifying the final object here.
    return(deliver);
}
