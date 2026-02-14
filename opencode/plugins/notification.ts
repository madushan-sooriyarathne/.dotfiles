import type { Plugin } from "@opencode-ai/plugin";

export const NotificationPlugin: Plugin = async ({ $ }) => {
  // Event configurations with meaningful text
  const eventConfigs: Record<
    string,
    { speech: string; title: string; message: string }
  > = {
    "permission.asked": {
      speech: "Permission Required",
      title: "OpenCode - Permission",
      message: "Your attention is needed to approve a permission request.",
    },
    "session.compacted": {
      speech: "Session compacted",
      title: "OpenCode - Session",
      message: "Your session has been compacted to save context space.",
    },
    "session.idle": {
      speech: "Task completed",
      title: "OpenCode - Complete",
      message: "Your AI task has been completed and the session is now idle.",
    },
  };

  return {
    event: async ({ event }) => {
      const config = eventConfigs[event.type];
      if (!config) return;

      // Play speech using macOS say command (runs in background)
      $`say ${config.speech}`.catch(() => {});

      // Show macOS notification
      await $`osascript -e 'display notification "${config.message}" with title "${config.title}"'`;
    },
  };
};
