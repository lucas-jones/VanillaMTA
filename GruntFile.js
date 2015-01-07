module.exports = function (grunt)
{
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-haxe');
	grunt.loadNpmTasks('grunt-concurrent');
	grunt.loadNpmTasks('grunt-shell');
	grunt.loadNpmTasks('grunt-contrib-copy');
	
	var config = grunt.file.readJSON("config.json");;

	grunt.config.init(
	{
		haxe:
		{
			server:
			{
				hxml: 'server.hxml'
			},
			client:
			{
				hxml: 'client.hxml'
			}
		},

		watch:
		{
			haxe:
			{
				files: '**/*.hx',
				tasks: [ 'haxe:server', 'haxe:client', 'copy:plugin', 'refresh' ]
			}
		},

		concurrent:
		{
			options:
			{
			   logConcurrentOutput: true
			},
			watch:
			{
				tasks: [ "watch:haxe" ]
			}
		},

		copy:
		{
			plugin:
			{
				files: [{
							cwd: 'bin/',
							expand: true,
							src: ['**'],
							dest: config.bin
						}]
			}
		}
	});

	grunt.registerTask('refresh', function()
	{
		console.log(config.bin);
		var exec = require('child_process').exec;
		console.log(exec('curl --user ' + config.livereload.username + ":" + config.livereload.password + ' http://127.0.0.1:22005/resourcemanager/call/restartResource --data [\\"^R^vanilla\\"]'));
	});

	grunt.registerTask('default', [ 'haxe:server', 'haxe:client', 'watch']);
}
