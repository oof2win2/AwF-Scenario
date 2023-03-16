<p align="center">
  <img alt="logo" src="https://cdn.discordapp.com/icons/548410604679856151/b69e6b33b328491ebbcbe050ff4de269.webp" width="120">
</p>
<h1 align="center">AwF Scenario Repository</h2>

## All-Weekend Factorio

Explosive Gaming (often ExpGaming) is a server hosting community with a strong focus on [Factorio][factorio] and games with similar themes. We are best known for our weekly reset Factorio server with a vanilla+ scenario. Although our servers tend to attract the more experienced players, our servers are open to everyone. You can find us through our [website], [discord], or the public server list with the name ExpGaming.

## Use and Installation

1) Download our [git repository][stable-dl] for the stable release. For the latest features you can download our [dev branch][experimental-dl]. See [releases](#releases) for other major releases.

2. Extract the downloaded zip file from the branch you downloaded into Factorio's scenario directory:

   - Windows: `%appdata%\Factorio\scenarios`
   - Linux: `~/.factorio/scenarios`

3. Within the scenario you can find `./config/_file_loader.lua` which contains a list of all the modules that will be loaded by the scenario; simply comment out (or remove) features you do not want but note that some modules may load other modules as dependencies even when removed from the list.

4. More advanced users may want to play with the other configs files within `./config` but please be aware that some of the config files will require a basic understanding of lua while others may just be a list of values.

<<<<<<< HEAD
5. Once you have made any config changes that you wish to make open Factorio, select play, then start scenario (or host scenario from within multiplayer tab), and select the scenario which will be called `scenario-master` if you have downloaded the latest stable release and have not changed the folder name.

6. The scenario will now load all the selected modules and start the map, any errors or exceptions raised in the scenario should not cause a game/server crash, so if any features do not work as expected then it may be returning an error in the log.
   Please report these errors to [the issues page](issues).

## Contributing
=======
6) You will now be asked to generate your map and the scenario will load all selected modules. If any module does not load as expected please check `factorio-current.log` in your Factorio directory for errors and report them to our [issues page][issues].

## Contributing

All are welcome to make bug reports, feature requests, and pull requests for our scenario. We do not require you to have any lua or coding knowledge to make bug reports and feature requests. If you have any questions ask us in our [discord].

For developers wanting to add features please follow these guidelines:

* All code is documented using ldoc, the end result can be found [here][docs].
* Changes should be made on your own fork and merged into `dev` through a pull request.
* Pull requests are automatically linted and documentation checked.
* Pull requests are manually reviewed to maintain code and language quality.
* New features should have the branch names: `feature/feature-name`
* Bug fixes should have the branch names: `fix/bug-name`

## Releases

| Release* | Release Name | Factorio Version** |
|---|---|---|
| [6.2][s6.2] | Mega Feature Bundle | [1.1.32][f1.1.32] |
| [6.1][s6.1] | External Data Overhaul | [1.0.0][f1.0.0] |
| [6.0][s6.0] | Gui / 0.18 Overhaul | [0.18.17][f0.18.17] |
| [5.10][s5.10] | Data Store Rewrite | [0.17.71][f0.17.71] |
| [5.9][s5.9] | Control Modules and Documentation | [0.17.63][f0.17.63] |
| [5.8][s5.8] | Home and Chat Bot | [0.17.47][f0.17.49] |
| [5.7][s5.7] | Warp System | [0.17.47][f0.17.47] |
| [5.6][s5.6] | Information Guis | [0.17.44][f0.17.44] |
| [5.5][s5.5] | Gui System | [0.17.43][f0.17.43] |
| [5.4][s5.4] | Admin Controls | [0.17.32][f0.17.32] |
| [5.3][s5.3] | Custom Roles | [0.17.28][f0.17.28] |
| [5.2][s5.2] | Quality of life | [0.17.22][f0.17.22] |
| [5.1][s5.1] | Permission Groups | [0.17.13][f0.17.13] |
| [5.0][s5.0] | 0.17 Overhaul| [0.17][f0.17.9] |
| [4.0][s4.0] | Softmod Manager | [0.16.51][f0.16.51] |
| [3.0][s3.0] | 0.16 Overhaul | [0.16][f0.16] |
| [2.0][s2.0] | Localization and clean up | [0.15][f0.15] |
| [1.0][s1.0] | Modulation | [0.15][f0.15] |
| [0.1][s0.1] | First Tracked Version | [0.14][f0.14] |

\* Scenario patch releases have been omitted and can be found [here][releases].

\*\* Factorio versions show the version they were made for, often the minimum requirement to run the scenario.

[s6.2]: https://github.com/explosivegaming/scenario/releases/tag/6.2.0
[s6.1]: https://github.com/explosivegaming/scenario/releases/tag/6.1.0
[s6.0]: https://github.com/explosivegaming/scenario/releases/tag/6.0.0
[s5.10]: https://github.com/explosivegaming/scenario/releases/tag/5.10.0
[s5.9]: https://github.com/explosivegaming/scenario/releases/tag/5.9.0
[s5.8]: https://github.com/explosivegaming/scenario/releases/tag/5.8.0
[s5.7]: https://github.com/explosivegaming/scenario/releases/tag/5.7.0
[s5.6]: https://github.com/explosivegaming/scenario/releases/tag/5.6.0
[s5.5]: https://github.com/explosivegaming/scenario/releases/tag/5.5.0
[s5.4]: https://github.com/explosivegaming/scenario/releases/tag/5.4.0
[s5.3]: https://github.com/explosivegaming/scenario/releases/tag/5.3.0
[s5.2]: https://github.com/explosivegaming/scenario/releases/tag/5.2.0
[s5.1]: https://github.com/explosivegaming/scenario/releases/tag/5.1.0
[s5.0]: https://github.com/explosivegaming/scenario/releases/tag/5.0.0
[s4.0]: https://github.com/explosivegaming/scenario/releases/tag/v4.0
[s3.0]: https://github.com/explosivegaming/scenario/releases/tag/v3.0
[s2.0]: https://github.com/explosivegaming/scenario/releases/tag/v2.0
[s1.0]: https://github.com/explosivegaming/scenario/releases/tag/v1.0
[s0.1]: https://github.com/explosivegaming/scenario/releases/tag/v0.1
>>>>>>> cdd34ebaea61e014b2cce9b251022009a13b55d4

All are welcome to make pull requests and issues for this scenario, if you are in any doubt, please ask someone in our discord. If you do not know lua and don't feel like learning you can always make a feature request. To find out what we already have please read our docs. Please keep in mind while making code changes:

- New features should have the branch names: `feature/feature-name`
- New features are merged into `dev` after it has been completed, this can be done through a pull request.
- After a number of features have been added a release branch is made: `release/X.Y.0`
- Bug fixes and localization can be made to the release branch with a pull request rather than into dev.
- A release is merged into `master` on the following friday after it is considered stable.
- Patches may be named `patch/X.Y.Z` and will be merged into `dev` and then `master` when appropriate.

The All-Weekend Factorio codebase is licensed under the [GNU General Public License v3.0](LICENSE)
discord: https://awf.yt

<<<<<<< HEAD
The original code for this scenario is from [Explosive Gaming](https://github.com/explosivegaming/scenario), we just adapted it to suit our needs and have some extra stuff we use
=======
[stable-dl]: https://github.com/explosivegaming/scenario/archive/master.zip
[experimental-dl]: https://github.com/explosivegaming/scenario/archive/dev.zip
[releases]: https://github.com/explosivegaming/scenario/releases
[factorio]: https://factorio.com
[docs]: https://explosivegaming.github.io/scenario
[issues]: https://github.com/explosivegaming/scenario/issues/new/choose
[website]: https://explosivegaming.nl
[discord]: https://discord.explosivegaming.nl
>>>>>>> cdd34ebaea61e014b2cce9b251022009a13b55d4
