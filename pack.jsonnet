local image = std.extVar('image');
local action = std.parseJson(std.extVar('action'));

local patch = {"runs":
		{
			"image": image
		}
} ;

std.manifestYamlDoc(std.mergePatch(action, patch))
