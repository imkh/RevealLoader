#import <Foundation/Foundation.h>
#import <dlfcn.h>

__attribute__((constructor)) static void init() {
    @autoreleasepool {
		void *handle = dlopen("/var/jb/Library/Application Support/RevealLoader/RevealServer", RTLD_NOW);
		if (handle) {
			NSLog(@"[RevealLoader] Successfully loaded RevealServer");
			// Start the Reveal Server manually: https://support.revealapp.com/hc/en-us/articles/360022481212-Manually-Starting-and-Stopping-the-Reveal-Server#starting-the-reveal-server-manually
			[[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
		} else {
			char *error = dlerror();
			NSLog(@"[RevealLoader] Failed to load RevealServer - dlopen error: %s", error);
		}
    }
}
