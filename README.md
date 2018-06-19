# copypack - Minecraft Modpack

This modpack is a small, personal 1.12 pack for me and a couple of friends to play and develop together. There's no real focus and only minor adjustments for now. Additionally, the pack is currently work-in-progress and probably will stay so forever.

## Download (for players)

Simply download the [MultiMC][multimc] instance `.zip` from **[HERE][download]**.  
It should automatically update itself with newer versions as they become available.

## Usage (for pack developers)

This repository uses [Voodoo][voodoo] to manage mods and build its pack. After you cloned it, you can get started using voodoo and thus be able to use the scripts included, by downloading the Voodoo bootstrapper from [its buildserver][voodoo-dl] and place it in the root folder as `bootstrap-voodoo.jar`.

### Building & Packing

You may use the `build` script to update the pack information (such as version), update some or even all mods to their latest version. If you're only updating configuration files and such, you can skip the `build` step.

```sh
# Update mod info and add new mods
./scripts/build
# Also update some mods
./scripts/build -E "Immersive Engineering" -E Charset
# Update all mods and dependencies to the latest version
./scripts/build --force
```

You can create the [SKCraft][skcraft], MultiMC and server packs using the `pack` script. The finished packs will end up in the `workspace/`, `.multimc/` and `.server/` directories, respectively.

```sh
./scripts/pack
```

### Testing

If you have MultiMC on your path, you can call the `test` script to create a test instance and run it inside of MultiMC. This also calls `pack` beforehand for convenience reasons, so changes made to `src/` will be applied to the instance.

```sh
./scripts/test
# Completely wipe the instance, removing worlds, options, etc
./scripts/test --clean
```

### Release

The `release` command will update the `.yaml` definition file with the specified version, run the `build` and `pack` scripts, and create a new `"Release [VERSION]"` commit as well as a `v[VERSION]` tag, pushing it to `origin`.

```sh
./scripts/release 1.2.5
```

Afterwards, we upload the contents of `workspace/_upload/` to our webserver for MultiMC to be able to see this release and automatically update to the newest version.


[download]: https://copy.mcft.net/mc/copypack.zip
[voodoo]: https://github.com/elytra/Voodoo
[voodoo-dl]: https://ci.elytradev.com/job/elytra/job/Voodoo/job/master/
[skcraft]: https://www.skcraft.com/
[multimc]: https://multimc.org/
