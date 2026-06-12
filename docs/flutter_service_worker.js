'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"sitemap.xml": "817e4ed15bf83cce73ddcddc7828530f",
"favicon.ico": "153b468e6de12d8b5e7c6b33872fc4c0",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"google47c5d178e97f68e4.html": "5a7fe6b52c3b85ac323900a2ddae3ad6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/images/playstore.svg": "51e26bc588f59f6143d772b39b09bd02",
"assets/assets/images/experience/soprasteria.jpeg": "daf010b611b052ef7966df711555cff2",
"assets/assets/images/experience/capgemini.png": "354697b9e4c2d1de4b194fb3cffd99d9",
"assets/assets/images/experience/cuatroochenta.jpeg": "2a0d616d8108877ced6da5b226616f16",
"assets/assets/images/experience/sportmaniacs.jpeg": "a9217cf0294d3d5890742e3fe9382c67",
"assets/assets/images/experience/hiberus.jpg": "cd4942eec78959bf39ef1485ede2e333",
"assets/assets/images/education/upv.jpeg": "c9463178d99467287b66748c5106b04d",
"assets/assets/images/education/unir.jpeg": "b9df525a7b5f494b8221364dcc344773",
"assets/assets/images/education/florida.jpeg": "6b25dd2c4139f4c1be636072b075d8a0",
"assets/assets/images/education/oulu.jpeg": "59f4ef5544a466828ddf4b3bc2465cff",
"assets/assets/images/appstore.svg": "a0ce8c4787fc2bd188f314ac5f1bddf6",
"assets/assets/images/skills/devops.svg": "cf344b99dbd34a396902cd7ac276c0af",
"assets/assets/images/skills/language.svg": "a9404ca00d6e2b5c94f28422d3cf0e1f",
"assets/assets/images/skills/android.svg": "7b7fe701b18c0f156f96eb2f37b76916",
"assets/assets/images/skills/gen-ai.svg": "fa9255a3f97c0adedcd3551c0af442e5",
"assets/assets/images/skills/flutter.svg": "904431e1d0a8f5dd82ced84b278c7957",
"assets/assets/images/skills/code.svg": "627044d24e49bc77245ddd0b5b7d02e8",
"assets/assets/images/profile_image.png": "816d20f4964e390ccad2c85657a9cdb4",
"assets/assets/images/linkedin.svg": "5b238434e2862c877f08572b96c0ef7b",
"assets/assets/images/web.svg": "0810626e12008a0bab13a5de60702c84",
"assets/assets/images/projects/dsbank/screenshot1.jpg": "3267acaf2b10cf26cbdad95b871108b1",
"assets/assets/images/projects/dsbank/screenshot3.jpg": "b2320e80789d0ced5b84583a090eacb7",
"assets/assets/images/projects/dsbank/logo.webp": "79ca82b8189dc295d658fa9c86a2d51c",
"assets/assets/images/projects/dsbank/screenshot2.jpg": "970c31b66304d5b147388b11091fc907",
"assets/assets/images/projects/visualsensor/screenshot4.png": "64a0923a09210d4e40aa8cbfe56a0142",
"assets/assets/images/projects/visualsensor/screenshot2.png": "e0c197549beaabadb91ff28313b1f43a",
"assets/assets/images/projects/visualsensor/screenshot3.png": "de0705560538b7f19f3070a3ba5942c8",
"assets/assets/images/projects/visualsensor/logo.webp": "25451077283ab71c535063aa6ff33344",
"assets/assets/images/projects/visualsensor/screenshot1.png": "fb7cb7bc4e8dc2d19ffb9cb3c151a879",
"assets/assets/images/projects/sportmaniacs/logo.png": "908b6077f087fc4a794374c265503450",
"assets/assets/images/projects/sportmaniacs/screenshot4.png": "8680a0b031eac171872d5e492b33e467",
"assets/assets/images/projects/sportmaniacs/screenshot2.png": "0f56d6e62029585ec79408461aeaa3a5",
"assets/assets/images/projects/sportmaniacs/screenshot3.png": "bd37577bac3022a1bb98fcd93ca27e4a",
"assets/assets/images/projects/sportmaniacs/screenshot1.png": "b088865ab8d3ebab6d472da278c885b5",
"assets/assets/images/projects/sgad/screenshot9.png": "83fb7f7375448bff06e8be9309939811",
"assets/assets/images/projects/sgad/screenshot4.png": "878e5fea2393dadda997182d6f1bd8cd",
"assets/assets/images/projects/sgad/screenshot7.png": "7a98020e3fc567a089508c31ee0b70ae",
"assets/assets/images/projects/sgad/screenshot2.png": "03e77c31245b06e2d0b4f2d9364027ff",
"assets/assets/images/projects/sgad/screenshot3.png": "ac5f5a2d79f0641bff2e569bffc15817",
"assets/assets/images/projects/sgad/screenshot5.png": "95e755c4b2972940db49e8c534ccd525",
"assets/assets/images/projects/sgad/screenshot6.png": "c961844b60a9d9d6ddde9500140eee3f",
"assets/assets/images/projects/sgad/screenshot10.png": "899babec8528ffcddb262c09c644a587",
"assets/assets/images/projects/sgad/sgad.jpg": "96bb85392921568db1bfb44581fff942",
"assets/assets/images/projects/sgad/screenshot1.png": "47fdf69d75787cb80a2cebcb14c85129",
"assets/assets/images/projects/sgad/screenshot8.png": "e0d03b52e8ff6adf8209876b7d9f9839",
"assets/assets/images/projects/randomboxd/logo.png": "df13d5b80316848bd62564a88ce50bab",
"assets/assets/images/projects/randomboxd/screenshot4.png": "89e90a72ecdd77386f5ce8b870dcfee2",
"assets/assets/images/projects/randomboxd/screenshot2.png": "ca5dee08ad4b5afd5eb9687af848ba9c",
"assets/assets/images/projects/randomboxd/screenshot3.png": "677dbc9906b47571e853012e6727c7f3",
"assets/assets/images/projects/randomboxd/screenshot1.png": "740d565629d20e681f361283165eac84",
"assets/assets/images/projects/gymloop/screenshot4.jpg": "da689f022ae16a4c63bde7dcb5d95495",
"assets/assets/images/projects/gymloop/screenshot1.jpg": "686b576d5b17284513106851fa42cd7b",
"assets/assets/images/projects/gymloop/screenshot3.jpg": "9932a9db0bddc30b497447ac814e6dfd",
"assets/assets/images/projects/gymloop/logo.webp": "85d2f204f822b4f696c86f90f9a56ba5",
"assets/assets/images/projects/gymloop/screenshot2.jpg": "d415d57386d3ba80f51ba5f688a977f5",
"assets/assets/images/projects/imq/screenshot4.png": "0cea5048fc2398166c5fa6756fa3806e",
"assets/assets/images/projects/imq/screenshot2.png": "90bf5ced7c5f5154950dfbcabb491ebe",
"assets/assets/images/projects/imq/screenshot3.png": "2fef35fb604628175d9a1d4599b71530",
"assets/assets/images/projects/imq/logo.webp": "acc69c28402dab69208d678e51aa3b62",
"assets/assets/images/projects/imq/screenshot1.png": "2a17948717ec1e719b5c561be9602818",
"assets/assets/images/projects/posterxxl/screenshot4.png": "782441a86680cefdb0159f752a2981aa",
"assets/assets/images/projects/posterxxl/screenshot2.png": "a5489e1255cd8b55a4d239b14e16c27e",
"assets/assets/images/projects/posterxxl/screenshot3.png": "6b7464f00e455a944d6f12c48c70f478",
"assets/assets/images/projects/posterxxl/logo.webp": "ec68fc3825dc3662201bde4f19cb08bc",
"assets/assets/images/projects/posterxxl/screenshot1.png": "43aef72623183a45be1706e0d84fc10c",
"assets/assets/images/projects/skiana/screenshot4.png": "17f12faff07a7694095a3f5c34758824",
"assets/assets/images/projects/skiana/screenshot3.png": "031a597f51c1486cef267f9f567f7dfc",
"assets/assets/images/projects/skiana/logo.jpg": "c64aebe7ec12b531288e1dfaea15fd4f",
"assets/assets/images/projects/skiana/screenshot1.png": "f2195da7f9138237829764f064f961c5",
"assets/assets/images/projects/skiana/screenshot2.jpg": "48310449f48935112534c30f62b84046",
"assets/assets/images/projects/druni/screenshot4.jpg": "af348c3aa9627cced8c62db679bbcba2",
"assets/assets/images/projects/druni/screenshot1.jpg": "1a4e50cd363e92065907150736749ed4",
"assets/assets/images/projects/druni/screenshot3.jpg": "1c471d51b23dfe1a97ff560415116d57",
"assets/assets/images/projects/druni/logo.webp": "211d908273226079048de11982ba7268",
"assets/assets/images/projects/druni/screenshot2.jpg": "de1d74cab78302e3df1f1f8a8c878953",
"assets/assets/images/github.svg": "96f4c70dbba91447363cab560a33762c",
"assets/assets/raw/education.json": "f25d6cb4d0f0e7a9f3ca5deb54b3e115",
"assets/assets/raw/profile.json": "1e3abc9427fd3c9e9362f394b9ced421",
"assets/assets/raw/skills.json": "c4503d3e47079460e013763b493268d5",
"assets/assets/raw/experience.json": "c85150c1eaf28fc524bed00b0d5bbe8a",
"assets/assets/raw/about.json": "3942f0c25892ea271e53581219b6b29d",
"assets/assets/raw/projects.json": "72eff184799bd40887ce52c2ba549d50",
"assets/AssetManifest.bin.json": "e6594244889bca004bc7d091d740f6ed",
"assets/fonts/MaterialIcons-Regular.otf": "3c7995a998271e33a721477bce1acdfe",
"assets/AssetManifest.bin": "aaa419073f8833aaf92d479094fa33c6",
"assets/NOTICES": "ffbcb3f4b7f0067cefaf34391161a92d",
"assets/AssetManifest.json": "3784120c269078bfdee461c3da285a8a",
"icons/apple-icon-76x76.png": "3e21145e4fa7803552eef1044c1ac54f",
"icons/apple-icon-72x72.png": "248156b78a3de6c5f2821a13afbb4976",
"icons/android-icon-144x144.png": "93c9bbf3b07310cc5bacff266b10184e",
"icons/apple-icon-114x114.png": "3e23410c5b5bd7e8a8b67c0b997c333e",
"icons/android-icon-72x72.png": "b1093022f754686258a7c48148d634e9",
"icons/favicon.ico": "153b468e6de12d8b5e7c6b33872fc4c0",
"icons/ms-icon-150x150.png": "bc16d9854acbd2d3d080f43d9ba591f7",
"icons/apple-icon-144x144.png": "b88b5b66cd761465fae852d214a83bc1",
"icons/favicon-96x96.png": "1ade5a97eb326f60570b359abe64b8b3",
"icons/android-icon-192x192.png": "e6fd3454726a6b2241a474779d5761e6",
"icons/apple-icon-60x60.png": "3b5a773dc0a6c387b62ce05e2c89c66b",
"icons/apple-icon-120x120.png": "6544c5aa52e96c1310e3cefca384602c",
"icons/favicon-32x32.png": "e5039182eb8a204ba672568a2ffc7fb0",
"icons/apple-icon-precomposed.png": "877611fec7841dbfe36b1e7bc2ff115d",
"icons/favicon-16x16.png": "42ce16bc0a51e47a05e0e365860d3de1",
"icons/apple-icon-57x57.png": "33080ac1412ba4eb0d393207dc0fa6f5",
"icons/android-icon-36x36.png": "aa176bbd2fde7f0df9b3889e10e2b472",
"icons/android-icon-96x96.png": "0a1de0f0811ce3bdabb6734f6bf3acb8",
"icons/android-icon-48x48.png": "4652d39fcaee28d0d2298966d54f4e1e",
"icons/apple-icon-180x180.png": "c5dcaefc213488afc2066126bff3fcdc",
"icons/apple-icon.png": "877611fec7841dbfe36b1e7bc2ff115d",
"icons/ms-icon-70x70.png": "a497cb4e8caf777e7f67fbe4ef376729",
"icons/ms-icon-144x144.png": "b88b5b66cd761465fae852d214a83bc1",
"icons/apple-icon-152x152.png": "9c9753d613d0f0dddc83592d1a60933d",
"icons/ms-icon-310x310.png": "eeb4662e098ffc654b05d65e824c3529",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"flutter_bootstrap.js": "c0bccb71a7f2c841e202229cb67128c2",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"robots.txt": "0a7737bc9096de7a16f57c10b1fbaca7",
"index.html": "2928ea2b73dbd908f8c0a0556351c11d",
"/": "2928ea2b73dbd908f8c0a0556351c11d",
"main.dart.js": "4cbe9ebc9d76c89a9d84c75afd4810ed",
"manifest.json": "1d273d03b889b73dc14d0e0133051908",
"version.json": "75d154e6e5c24976bb7303259fdd399c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
